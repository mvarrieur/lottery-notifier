require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "win_notifier" do
    mail = UserMailer.win_notifier
    assert_equal "Win notifier", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
