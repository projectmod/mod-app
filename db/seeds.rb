admin = User.find_or_create_by!(email: "admin@mod.com")
admin.update(password: 'password', password_confirmation: 'password', role: 'admin', name: "Admin")
admin.activate
admin.set_as_admin
admin.save!

merchant = User.find_or_create_by!(email: "merchant@mod.com")
merchant.update(password: 'password', password_confirmation: 'password', role: 'merchant', name: "Merchant")
merchant.activate
merchant.set_as_merchant
merchant.save!

user = User.find_or_create_by!(email: "user@gmail.com")
user.update(password: 'password', password_confirmation: 'password', name: "Kean Seng")
user.activate
user.set_as_user
user.save!