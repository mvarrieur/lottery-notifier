desc "This task is called by the Heroku scheduler add-on"
task :update_feed => :environment do
  puts "Updating from RSS feed..."
  LotteryNumber.get_latest
  puts "Updated from RSS Feed."

  puts 'Emailing Winner'
  User.email_winner
  puts 'Emailed Winner'
end