class User < ActiveRecord::Base
  attr_accessible :email, :name
  has_many :picks

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  validates :name, presence: true

  def self.email_winner
    @users = Array.new
    User.all.each do |user|
      user.picks do |pick|
        if pick.pick_number == LotteryNumber.winning_last_three_digits
          @users.push(user)
        end
      end
    end

    @user.each do |user|
      # Email each user here
    end
  end
end
