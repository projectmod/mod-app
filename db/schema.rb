# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150724080536) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "authentications", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.string   "provider",   null: false
    t.string   "uid",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "secret"
    t.string   "token"
  end

  add_index "authentications", ["provider", "uid"], name: "index_authentications_on_provider_and_uid", using: :btree

  create_table "bookings", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "confirmation_code"
    t.integer  "outlet_id"
    t.string   "outlet_number"
    t.string   "user_number"
    t.boolean  "outlet_confirmed",  default: false
    t.boolean  "user_cancellation", default: false
  end

  create_table "outlets", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "state"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "price_range"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "type_of_service", default: [],                 array: true
    t.string   "phone_no"
    t.string   "area"
    t.boolean  "availability",    default: false
    t.integer  "credits"
<<<<<<< HEAD
    t.string   "avatar",          default: [],                 array: true
    t.string   "working_hours"
=======
    t.string   "opening_hours"
    t.string   "opening_days"
    t.string   "avatar",          default: [],                 array: true
>>>>>>> 03a0feb550557193c608b8bf76566cd8504d2204
  end

  create_table "packages", force: :cascade do |t|
    t.decimal  "price"
    t.string   "description"
    t.string   "title"
    t.integer  "credits"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "payment_transactions", force: :cascade do |t|
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.decimal  "price"
    t.string   "receipt_code"
    t.string   "payment_method"
    t.integer  "package_id"
  end

  create_table "roles", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "failed_logins_count",             default: 0
    t.datetime "lock_expires_at"
    t.string   "unlock_token"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.string   "name"
    t.string   "avatar"
    t.string   "phone_no"
    t.string   "verification_code"
    t.boolean  "activated",                       default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", using: :btree

end
