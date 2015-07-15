admin = User.find_or_create_by!(email: "admin@mod.com")
admin.update(password: "password", password_confirmation: "password", role: "admin", name: "Admin", phone_no: "0126832814")
admin.activate
admin.set_as_admin
admin.save!

merchant = User.find_or_create_by!(email: "merchant@mod.com")
merchant.update(password: "password", password_confirmation: "password", role: "merchant", name: "Merchant", phone_no: "012345678")
merchant.activate
merchant.set_as_merchant
merchant.save!

user = User.find_or_create_by!(email: "user@gmail.com")
user.update(password: "password", password_confirmation: "password", name: "Kean Seng")
user.activate
user.set_as_user
user.save!

role_1 = Role.create(name: "merchant", user_id: 1, merchant_id: 1)

merchant_1 =  admin.merchants.find_or_create_by!(name: "Toni and Guy")

merchant_2 =  admin.merchants.find_or_create_by!(name: "A Cut Above")

merchant_3 =  admin.merchants.find_or_create_by!(name: "Barber")

outlet_1 = merchant_1.outlets.find_or_create_by!(name: "Toni and Guy")
outlet_1.update(avatar: "http://media-cdn.tripadvisor.com/media/photo-s/05/26/ac/f4/tgi-fridays.jpg",
                type_of_service: ["BLOWOUT", "HAIRCUT", "MASSAGE"],
                area: "Bangsar Baru",
                address: "99, Jalan 99, 99999, K.L",
                price_range: "RM 50 - 100",
                state: "Kuala Lumpur",
                latitude: 3.167439,
                longitude: 101.612685,
                phone_no: "0126832814")

outlet_2 = merchant_2.outlets.find_or_create_by!(name: "A Cut Above")
outlet_2.update(avatar: "http://media-cdn.tripadvisor.com/media/photo-s/05/26/ac/f4/tgi-fridays.jpg",
                type_of_service: ["BLOWOUT"],
                area: "Bangsar Baru",
                address: "99, Jalan 99, 99999, K.L",
                price_range: "RM 50 - 100",
                state: "Selagor",
                phone_no: "124324264")

outlet_3 = merchant_3.outlets.find_or_create_by!(name: "Barber")
outlet_3.update(avatar: "http://media-cdn.tripadvisor.com/media/photo-s/05/26/ac/f4/tgi-fridays.jpg",
                type_of_service: ["MASSAGE", "HAIRCUT"],
                area: "Bangsar Baru",
                address: "99, Jalan 99, 99999, K.L",
                price_range: "RM 50 - 100",
                state: "Cyberjaya",
                phone_no: "543245465")
