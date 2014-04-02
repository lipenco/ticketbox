# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


5.times do
  FactoryGirl.create(:category)
end

30.times do
  FactoryGirl.create(:user)
end

User.all.each do |user|
  Category.all.each do |category|
    10.times do
      ticket = FactoryGirl.create(:ticket)
      ticket.category = category
      user.tickets << ticket
      user.save
    end
  end
end
