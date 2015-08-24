FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password "123123"
    password_confirmation "123123"
    role "user"
    phone_number "127167787"
  end
end
