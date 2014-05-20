GameType.create(name: "FIFA", color: "#8ab67a")
GameType.create(name: "Table Tennis", color: "#b67989")
GameType.create(name: "Pool", color: "#7989b6")
GameType.create(name: "Table Football", color: "#A77BB6")

Player.create(FactoryGirl.attributes_for(:player).merge(first_name: "James", last_name: "Cook", email: "james.cook@fundingcircle.com"))
Player.create(FactoryGirl.attributes_for(:player).merge(first_name: "Sam", last_name: "Johnson", email: "sam.johnson@fundingcircle.com"))
Player.create(FactoryGirl.attributes_for(:player).merge(first_name: "Rob", last_name: "Kemp", email: "rob.kemp@fundingcircle.com"))
Player.create(FactoryGirl.attributes_for(:player).merge(first_name: "Rosie", last_name: "Brigham", email: "rosie.brigham@fundingcircle.com"))
Player.create(FactoryGirl.attributes_for(:player).merge(first_name: "Teja", last_name: "Kocjancic", email: "teja.kocjancic@fundingcircle.com"))
Player.create(FactoryGirl.attributes_for(:player).merge(first_name: "Shaban", last_name: "Karumba", email: "shaban.karumba@fundingcircle.com"))
Player.create(FactoryGirl.attributes_for(:player).merge(first_name: "Angela", last_name: "Ebirim", email: "angela.ebirim@fundingcircle.com"))
Player.create(FactoryGirl.attributes_for(:player).merge(first_name: "Helene", last_name: "Martin", email: "helene.martin@fundingcircle.com"))
Player.create(FactoryGirl.attributes_for(:player).merge(first_name: "Mal", last_name: "Pinder", email: "mal.pinder@fundingcircle.com"))



