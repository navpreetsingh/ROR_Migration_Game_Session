# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

(5..20).each do |n|
	Group.create(name: "Group#{n}", email: "group#{n}@example.com")
	Channel.create(name: "Channel#{n}", site_url: "channel#{n}@example.com")
	Product.create(name: "Product#{n}", price: 20.30)
end