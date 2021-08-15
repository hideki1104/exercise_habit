FactoryBot.define do
  factory :training do
    sequence(:name) { |n| "test_#{n}" }
    url { "abcdefghij" }
    training_type { 0 }
    genre_id { 1 }
    difficuly_type { 0 }
  end
end
