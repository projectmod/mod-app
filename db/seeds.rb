# Admin
User.create(email: "admin@mod.com",
  password: "password",
  password_confirmation: "password",
  name: "Admin",
  phone_no: "0126832814",
  role: "admin")

# Merchant
merchant = User.create(email: "merchant@mod.com",
  password: "password",
  password_confirmation: "password",
  name: "Merchant",
  role: "merchant",
  activated: true,
  phone_no: "012345678")

# User
User.create(email: "user@gmail.com",
  password: "password",
  password_confirmation: "password",
  name: "Kean Seng",
  phone_no: "012345678")

Booking.create(user_id: 3, confirmation_code: "abc123", user_number: "32455", outlet_number: "24534231")
Package.create(price: 20.00, description: "10 BOOKINGS", title: "RM 20", credits: 20)
Package.create(price: 50.00, description: "25 BOOKINGS", title: "RM 50", credits: 50)
Package.create(price: 100.00, description: "50 + 5 FREE BOOKINGS", title: "RM 100", credits: 110)

merchant.create_outlet(name: "Toni and Guy",
  type_of_service: ["BLOWOUT", "HAIRCUT", "MASSAGE"],
  area: "Bangsar Baru",
  address: "99, Jalan 99, 99999, K.L",
  price_range: "RM 50 - 100",
  state: "Kuala Lumpur",
  latitude: 3.167439,
  longitude: 101.612685,
  phone_no: "0126832814",
  availability: true,
  business_registration: "test12",
  working_hours: "Monday - Friday")

Outlet.create(name: "A Cut Above",
  type_of_service: ["BLOWOUT"],
  area: "Bangsar Baru",
  address: "99, Jalan 99, 99999, K.L",
  price_range: "RM 50 - 100",
  state: "Selangor",
  latitude: 3.167439,
  longitude: 101.612685,
  phone_no: "124324264",
  working_hours: "Monday - Friday",
  business_registration: "test123",
  availability: true)

Outlet.create(name: "Barber",
  type_of_service: ["MASSAGE", "HAIRCUT"],
  area: "Bangsar Baru",
  address: "99, Jalan 99, 99999, K.L",
  price_range: "RM 50 - 100",
  state: "Cyberjaya",
  phone_no: "543245465",
  latitude: 3.167439,
  longitude: 101.612685,
  working_hours: "Monday - Friday",
  business_registration: "test1234",
  availability: true)

Outlet.create(name: "Rainbow Salon",
  type_of_service: ["BLOWOUT", "HAIRCUT"],
  area: "Hartamas",
  address: "99, Jalan 99, 99999, K.L",
  price_range: "RM 50 - 100",
  state: "Kuala Lumpur",
  latitude: 3.167439,
  longitude: 101.612685,
  phone_no: "0126832814",
  working_hours: "Monday - Friday",
  business_registration: "test12345",
  availability: true)

Outlet.create(name: "Mark and Guys",
  type_of_service: ["BLOWOUT", "HAIRCUT", "NAILS"],
  area: "Ampang",
  address: "99, Jalan 99, 99999, K.L",
  price_range: "RM 50 - 100",
  state: "Kuala Lumpur",
  latitude: 3.167439,
  longitude: 101.612685,
  phone_no: "0126832814",
  working_hours: "Monday - Friday",
  business_registration: "test12345",
  availability: true)

Outlet.update_all(credits: 20, avatar: ["http://www.aquasalonnewportbeach.com/img/slides/slide-bg2.jpg",
  "http://allergicliving.com/wp-content/uploads/2012/02/Nut-Allergy-Nail-Salon-1.jpg",
  "http://www.dudleycourt-beautysalon.co.uk/Images/dudleycourt-background1.jpg",
  "http://au.businessdirectoryformobile.com/blog/wp-content/uploads/2015/02/Hair-Beauty-Salon-Adelaide.jpg",
  "http://www.lafemmehairandbeautysalon.co.uk/wp-content/gallery/gallery1/salon5.jpg"])
