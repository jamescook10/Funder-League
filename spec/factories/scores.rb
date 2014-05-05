# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :score do
    player nil
    game nil
    value "MyString"
  end
end
