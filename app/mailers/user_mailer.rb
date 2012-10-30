class UserMailer < ActionMailer::Base
  default from: 'holbrook.notifier@gmail.com'

  def win_notifier(user, lottery_number)
    @user = user
    @lottery_number = lottery_number
    @gun = GunCalendar.find_by_date(lottery_number.draw_date)

    mail to: user.email, subject: 'Mid-Day Numbers Game Match Notification'
  end
end
