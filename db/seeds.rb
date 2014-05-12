# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

GameType.create(name: "FIFA")
GameType.create(name: "Table Tennis")
GameType.create(name: "Pool")
GameType.create(name: "Table Football")


10.times do
  Player.create(FactoryGirl.attributes_for(:player))
end


