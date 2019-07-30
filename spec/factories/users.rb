FactoryBot.define do
  factory :user do
    sequence(:name)  { |n| "Example User-#{n}" }
    sequence(:email) { |n| "user-#{n}@example.com" }
    password         { "password" }
  end
end
