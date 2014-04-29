# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :game do
    game_type_id 1
    player_score 1
    opponent_score 2
    opponent_id 2
  end
end
