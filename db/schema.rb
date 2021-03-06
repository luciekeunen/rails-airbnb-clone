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

ActiveRecord::Schema.define(version: 20171129152346) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string   "title"
    t.text     "synopsis"
    t.string   "author"
    t.string   "photo"
    t.string   "genre"
    t.float    "average_rating"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "collection_items", force: :cascade do |t|
    t.integer  "price_per_day"
    t.text     "description"
    t.string   "quality"
    t.string   "edition"
    t.integer  "profile_id"
    t.integer  "book_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["book_id"], name: "index_collection_items_on_book_id", using: :btree
    t.index ["profile_id"], name: "index_collection_items_on_profile_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.text     "content"
    t.integer  "profile_id"
    t.integer  "collection_item_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["collection_item_id"], name: "index_messages_on_collection_item_id", using: :btree
    t.index ["profile_id"], name: "index_messages_on_profile_id", using: :btree
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.string   "phone_number"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "photo"
    t.string   "city"
    t.string   "country_code"
    t.string   "zip_code"
    t.float    "latitude"
    t.float    "longitude"
    t.index ["user_id"], name: "index_profiles_on_user_id", using: :btree
  end

  create_table "reservations", force: :cascade do |t|
    t.string   "status"
    t.integer  "final_price"
    t.date     "start_day"
    t.date     "end_day"
    t.integer  "profile_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "collection_item_id"
    t.index ["collection_item_id"], name: "index_reservations_on_collection_item_id", using: :btree
    t.index ["profile_id"], name: "index_reservations_on_profile_id", using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.text     "content"
    t.float    "rating"
    t.integer  "profile_id"
    t.integer  "collection_item_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["collection_item_id"], name: "index_reviews_on_collection_item_id", using: :btree
    t.index ["profile_id"], name: "index_reviews_on_profile_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "facebook_picture_url"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "token"
    t.datetime "token_expiry"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "collection_items", "books"
  add_foreign_key "collection_items", "profiles"
  add_foreign_key "messages", "collection_items"
  add_foreign_key "messages", "profiles"
  add_foreign_key "profiles", "users"
  add_foreign_key "reservations", "collection_items"
  add_foreign_key "reservations", "profiles"
  add_foreign_key "reviews", "collection_items"
  add_foreign_key "reviews", "profiles"
end
