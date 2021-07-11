FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "test_#{n}" }
    sequence(:email) { |n| "test#{n}@example.com" }
    sequence(:password) { 'password' }
    height {170}
    sex {0}
    birthday {"1990-01-01"}
    training_type {0}
  end
end