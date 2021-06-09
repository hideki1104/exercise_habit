FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "test_#{n}" }
    sequence(:email) { |n| "hideki#{n}@example.com" }
    sequence(:password) { 'password' }
  end
end