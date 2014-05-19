# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

GameType.create(name: "FIFA", color: "#8ab67a")
GameType.create(name: "Table Tennis", color: "#b67989")
GameType.create(name: "Pool", color: "#7989b6")
GameType.create(name: "Table Football", color: "#A77BB6")


10.times do
  Player.create(FactoryGirl.attributes_for(:player))
end


