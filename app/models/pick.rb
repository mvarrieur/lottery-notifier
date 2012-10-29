class Pick < ActiveRecord::Base
  attr_accessible :pick_number, :user_id
  VALID_PICK_REGEX = /[0-9]{3,3}/
  validates :pick_number, length: {maximum: 3}, format: { with: VALID_PICK_REGEX, message: 'must be three digits' }

  belongs_to :user

  self.per_page = 30

  def self.email_winner
    picks = Pick.find_all_by_pick_number(LotteryNumber.current)
    picks.each do |pick|
      UserMailer.win_notifier(pick.user, LotteryNumber.current).deliver
    end
  end
end
