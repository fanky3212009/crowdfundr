# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

100.times do |i|

Project.create({
  title: "Product#{i+100}",
  description: "Description#{i+100}",
  goal: (i+100),
  end_date: Time.now,
  category_id: 1,
  owner_id: 1
  }
)
end
