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

ActiveRecord::Schema.define(version: 2019_11_27_092605) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "fam_id"
    t.string "status", default: "pending"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer "number_of_guests"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fam_id"], name: "index_bookings_on_fam_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "bookings_reviews", force: :cascade do |t|
    t.bigint "booking_id"
    t.string "content"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_bookings_reviews_on_booking_id"
  end

  create_table "fams", force: :cascade do |t|
    t.string "name"
    t.integer "members"
    t.integer "price"
    t.string "cultural_experience"
    t.string "language"
    t.string "housing_type"
    t.string "location"
    t.text "description"
    t.string "capacity"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.index ["user_id"], name: "index_fams_on_user_id"
  end

  create_table "pictures", force: :cascade do |t|
    t.string "photo"
    t.bigint "fam_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fam_id"], name: "index_pictures_on_fam_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.text "description"
    t.bigint "booking_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_reviews_on_booking_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "language"
    t.string "description"
    t.integer "age"
    t.string "nationality"
    t.string "gender"
    t.string "photo"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "fams"
  add_foreign_key "bookings", "users"
  add_foreign_key "bookings_reviews", "bookings"
  add_foreign_key "fams", "users"
  add_foreign_key "pictures", "fams"
  add_foreign_key "reviews", "bookings"
end
