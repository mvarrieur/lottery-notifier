class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def win_notifier(user, lottery_number)
    @user = user

    mail to: user.email, subject: 'Mid-Day Numbers Game Match Notification'
  end
end
