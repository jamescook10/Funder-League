# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :score do
    player_id 1
    game_id 1
    value "5"
  end
end
