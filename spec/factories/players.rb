# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :player do
    first_name "Sam"
    last_name "Johnson"
    twitter "samhjohnson"
    email "sam.johnson@fundingcircle.com"
    password "password"
    password_confirmation "password"
  end
end
