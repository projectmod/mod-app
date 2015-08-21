FactoryGirl.define do
  factory :outlet do
    user
    
    # name { Faker::Internet.name }
    address "7, Jalan Faker, Taman Gula, Bangsar 48100"
    state "KL"
    latitude 3.167439
    longitude 101.612685
    price_range "RM 50 - 100"
    type_of_service ["HAIRCUT", "BLOWOUT"]
    business_registration "faker1234"
    avatar { Faker::Avatar.image }
    credits 20
  end
end
