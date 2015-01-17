FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "testuser#{n}" }
    sequence(:email) { |n| "testuser#{n}@test.com" }
  end
end
