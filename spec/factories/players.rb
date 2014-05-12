# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :player do
    sequence(:first_name) {|n| "Player #{n}" }
    last_name "Surname"
    sequence(:email) {|n| "player.name#{n}@fundingcircle.com" }
    password "password"
    password_confirmation "password"
    confirmed_at Time.now
    end
  end
