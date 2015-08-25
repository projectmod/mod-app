FactoryGirl.define do
  factory :outlet do
    user

    name { Faker::Company.name }
    area { Faker::Address.street_name }
    address { Faker::Address.street_address }
    phone_number "0378834455"
    type_of_service ["HAIRCUT", "BLOWOUT", "MASSAGE"]
    price_range "RM 50 - 100"
    latitude 3.167439
    longitude 101.612685
    business_registration "faker1234"
    # credits 20
  end
end
