# Admin
User.create(email: "admin@mod.com",
  password: "password",
  password_confirmation: "password",
  name: "Admin",
  phone_number: "0126832814",
  role: "admin")

# Merchant
merchant = User.create(email: "merchant@mod.com",
  password: "password",
  password_confirmation: "password",
  name: "Merchant",
  role: "merchant",
  credits: 20,
  activated: true,
  phone_number: "012345678")

# User
User.create(email: "user@gmail.com",
  password: "password",
  password_confirmation: "password",
  name: "Kean Seng",
  phone_number: "012345678")

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
  phone_number: "0122205289",
  availability: true,
  business_registration: "test12")

Outlet.update_all(latitude: 3.167439, longitude: 101.612685)
