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

ActiveRecord::Schema.define(version: 20150820003558) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "authentications", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.string   "provider",   null: false
    t.string   "uid",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "token"
    t.string   "secret"
  end

  add_index "authentications", ["provider", "uid"], name: "index_authentications_on_provider_and_uid", using: :btree

  create_table "bookings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "outlet_id"
    t.string   "confirmation_code"
    t.boolean  "user_cancellation", default: false
    t.boolean  "outlet_confirmed",  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", force: :cascade do |t|
    t.integer  "outlet_id"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "outlets", force: :cascade do |t|
    t.string   "name"
    t.string   "area"
    t.string   "address"
    t.string   "state"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "price_range"
    t.string   "type_of_service",        default: ""
    t.string   "phone_number"
    t.boolean  "availability",           default: false
    t.integer  "user_id"
    t.string   "business_registration",                  null: false
    t.boolean  "completed_registration", default: false
    t.boolean  "featured",               default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "bookings_count",         default: 0
  end

  create_table "packages", force: :cascade do |t|
    t.decimal  "price"
    t.string   "description"
    t.string   "title"
    t.integer  "credits"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payment_transactions", force: :cascade do |t|
    t.decimal  "price"
    t.string   "payment_method"
    t.integer  "package_id"
    t.integer  "user_id"
    t.string   "bank_ref_no"
    t.string   "payment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                                           null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "activation_state"
    t.string   "activation_token"
    t.datetime "activation_token_expires_at"
    t.integer  "failed_logins_count",             default: 0
    t.datetime "lock_expires_at"
    t.string   "unlock_token"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.string   "name"
    t.string   "phone_number"
    t.string   "verification_code"
    t.boolean  "activated",                       default: false
    t.integer  "role",                            default: 0
    t.integer  "credits",                         default: 0
    t.integer  "payment_transactions_count",      default: 0
  end

  add_index "users", ["activation_token"], name: "index_users_on_activation_token", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", using: :btree

  create_table "working_hours", force: :cascade do |t|
    t.string   "days"
    t.string   "time"
    t.integer  "outlet_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
