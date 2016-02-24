# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do |proj|

  Project.create({
    title: Faker::App.name,
     description: Faker::Company.bs,
     goal: Faker::Number.number(5),
     end_date: Faker::Date.forward(100)
     })

end

# 10.times do |reward|
#
#   counter = 0
#     Reward.create({
#       title: "Gold",
#       description: Faker::Lorem.sentence,
#       amount: Faker::Number.number(2),
# })
#
#   end
#
#
