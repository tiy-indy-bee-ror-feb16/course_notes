FactoryGirl.define do
  factory :user do
    email     { Faker::Internet.safe_email }
    username  { Faker::Internet.user_name(nil, []) }
    password  { Faker::Internet.password(10, 20) }
  end
end
