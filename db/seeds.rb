admin = User.find_or_create_by!(email: "admin@mod.com")
admin.update(password: "password", password_confirmation: "password", role: "admin", name: "Admin")
admin.activate
admin.set_as_admin
admin.save!

merchant = User.find_or_create_by!(email: "merchant@mod.com")
merchant.update(password: "password", password_confirmation: "password", role: "merchant", name: "Merchant")
merchant.activate
merchant.set_as_merchant
merchant.save!

user = User.find_or_create_by!(email: "user@gmail.com")
user.update(password: "password", password_confirmation: "password", name: "Kean Seng")
user.activate
user.set_as_user
user.save!
 
merchant_1 =  admin.merchants.find_or_create_by!(name: "Toni and Guy")
merchant_1.update(avatar: "http://media-cdn.tripadvisor.com/media/photo-s/05/26/ac/f4/tgi-fridays.jpg",
                  type_of_service: "HAIRCUT",
                  address: "99, Jalan 99, 99999, K.L",
                  price_range: "RM 50 - 100")


merchant_2 =  admin.merchants.find_or_create_by!(name: "A Cut Above")
merchant_2.update(avatar: "http://media-cdn.tripadvisor.com/media/photo-s/05/26/ac/f4/tgi-fridays.jpg",
                  type_of_service: "BLOWOUT",
                  address: "99, Jalan 99, 99999, K.L",
                  price_range: "RM 0 - 50")


merchant_3 =  admin.merchants.find_or_create_by!(name: "Barber")
merchant_3.update(avatar: "http://media-cdn.tripadvisor.com/media/photo-s/05/26/ac/f4/tgi-fridays.jpg",
                  type_of_service: "MASSAGE",
                  address: "99, Jalan 99, 99999, K.L",
                  price_range: "ABOVE RM 100")