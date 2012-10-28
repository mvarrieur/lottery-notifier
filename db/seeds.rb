# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#pick = Pick.create(pick_number: '9-5-5-0')
user = User.create!(name: 'Mike Varrieur', email: 'Mikey7047@gmail.com')
user.picks.create!(pick_number: '4-9-8-1')