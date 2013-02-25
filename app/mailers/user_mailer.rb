class UserMailer < ActionMailer::Base
  default from: 'mike.varrieur@gmail.com'

  def win_notifier(user, lottery_number)
    @user = user
    @lottery_number = lottery_number
    @gun = GunCalendar.find_by_date(lottery_number.draw_date)

    mail to: user.email, subject: 'Evening Numbers Game Match Notification'
  end

  def welcome_email(user)
    @user = user

    mail to: user.email, subject: 'Welcome to the Pioneer Valley raffle notifier'
  end
end
