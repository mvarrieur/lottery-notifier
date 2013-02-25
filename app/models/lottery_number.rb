require 'net/http'

class LotteryNumber < ActiveRecord::Base
  attr_accessible :draw_date, :link, :next_draw, :winning_number
  validates :draw_date, :uniqueness => true

  self.per_page = 31

  def self.current
    LotteryNumber.last
  end

  def self.get_latest
    @lottery_number = LotteryNumber.new
    url = 'http://www.masslottery.com/data/rss/rssdata/xml/numbersgame-last-draw-evening.xml'
    xml_data = Net::HTTP.get_response(URI.parse(url)).body
    hash = Hash.from_xml(xml_data)
    draw_date = Date.strptime(hash['game']['draw']['draw_date'], "%m/%d/%Y")

    if draw_date >= 1.days.ago.to_datetime.in_time_zone('EST').to_date
      @lottery_number.draw_date = draw_date
      @lottery_number.next_draw = Date.strptime(hash['game']['draw']['next_draw_date'], "%m/%d/%Y")
      @lottery_number.winning_number = hash['game']['draw']['winning_num'].gsub('-','')[0,3]
      @lottery_number.link = hash['game']['draw']['video']
    end

    if @lottery_number.save!
      return @lottery_number
    else
      return nil
    end
  end
end
