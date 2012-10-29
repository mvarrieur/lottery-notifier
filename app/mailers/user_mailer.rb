class UserMailer < ActionMailer::Base
  default from: 'holbrook.notifier@gmail.com'

  def win_notifier(user, lottery_number)
    @user = user
    @lottery_number = lottery_number

    mail to: user.email, subject: 'Mid-Day Numbers Game Match Notification'
  end
end
