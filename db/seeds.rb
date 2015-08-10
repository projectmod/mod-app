# Admin
User.create(email: "admin@mod.com",
  password: "password",
  password_confirmation: "password",
  name: "Admin",
  phone_no: "0126832814",
  role: "admin")

# Merchant
User.create(email: "merchant@mod.com",
  password: "password",
  password_confirmation: "password",
  name: "Merchant",
  phone_no: "012345678")

# User
User.create(email: "user@gmail.com",
  password: "password",
  password_confirmation: "password",
  name: "Kean Seng",
  phone_no: "012345678")

Booking.create(user_id: 3, confirmation_code: "abc123", user_number: "32455", outlet_number: "24534231")
Package.create(price: 10, description: "10 for 100 credits", title: "Package 1", credits: 100)

Outlet.create(name: "Toni and Guy",
  type_of_service: ["BLOWOUT", "HAIRCUT", "MASSAGE"],
  area: "Bangsar Baru",
  address: "99, Jalan 99, 99999, K.L",
  price_range: "RM 50 - 100",
  state: "Kuala Lumpur",
  latitude: 3.167439,
  longitude: 101.612685,
  phone_no: "0126832814",
  availability: true,
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
  availability: true)

Outlet.update_all(credits: 20, avatar: ["http://www.aquasalonnewportbeach.com/img/slides/slide-bg2.jpg",
  "http://allergicliving.com/wp-content/uploads/2012/02/Nut-Allergy-Nail-Salon-1.jpg",
  "http://www.dudleycourt-beautysalon.co.uk/Images/dudleycourt-background1.jpg",
  "http://au.businessdirectoryformobile.com/blog/wp-content/uploads/2015/02/Hair-Beauty-Salon-Adelaide.jpg",
  "http://www.lafemmehairandbeautysalon.co.uk/wp-content/gallery/gallery1/salon5.jpg"])
