class User < ActiveRecord::Base
  attr_accessible :email, :name
  has_many :picks, dependent: :destroy
  accepts_nested_attributes_for :picks

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  validates :name, presence: true

  def self.email_winner
    @users = Array.new
    User.all.each do |user|
      user.picks.each do |pick|
        if pick.last_three_digits == LotteryNumber.winning_last_three_digits
          @users.push(user)
        end
      end
    end
    
    @users.each do |user|
      UserMailer.win_notifier(user, LotteryNumber.current).deliver
    end
  end
end
