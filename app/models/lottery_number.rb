require 'net/http'

class LotteryNumber < ActiveRecord::Base
  attr_accessible :draw_date, :link, :next_draw, :winning_number
  validates :draw_date, :uniqueness => true

  self.per_page = 30

  def self.current
    LotteryNumber.last
  end

  def self.get_latest
    @lottery_number = LotteryNumber.new
    url = 'http://www.masslottery.com/data/rss/masslottery_nb.xml'
    xml_data = Net::HTTP.get_response(URI.parse(url)).body
    hash = Hash.from_xml(xml_data)
    hash['rss']['channel']['item'].each do | drawing |
      if drawing['guid'] == 'NumbersCurrentMiddayDrawInformation'
        values = drawing['description'].scan(/^\s*(.*?):\s*(.*?)\s*$/)

        values.each do |key, value|
          case key
            when "MIDDAY DRAW DATE"
              @lottery_number.draw_date = Date.strptime(value, "%A %m/%d/%y")
            when "NEXT MIDDAY DRAW DATE"
              @lottery_number.next_draw = Date.strptime(value, "%A %m/%d/%y")
            when 'MIDDAY WINNING NUMBER'
              @lottery_number.winning_number = value.gsub('-','')[-3,3]
          end
        end
        @lottery_number.link = drawing['link']
      end
    end
    return @lottery_number.save!
  end
end
