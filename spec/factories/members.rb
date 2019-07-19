FactoryBot.define do
  factory :member do
    sequence(:name) { |n| "User_#{n} Name" }
  end
end
