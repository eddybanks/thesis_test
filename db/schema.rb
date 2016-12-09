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

ActiveRecord::Schema.define(version: 20161209033128) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "businesses", force: :cascade do |t|
    t.integer  "account_number"
    t.string   "ownership_name"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "film_and_film_fun_facts", force: :cascade do |t|
    t.integer  "film_id"
    t.integer  "film_fun_fact_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["film_fun_fact_id"], name: "index_film_and_film_fun_facts_on_film_fun_fact_id", using: :btree
    t.index ["film_id"], name: "index_film_and_film_fun_facts_on_film_id", using: :btree
  end

  create_table "film_and_film_locations", force: :cascade do |t|
    t.integer  "film_id"
    t.integer  "film_location_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["film_id"], name: "index_film_and_film_locations_on_film_id", using: :btree
    t.index ["film_location_id"], name: "index_film_and_film_locations_on_film_location_id", using: :btree
  end

  create_table "film_fun_facts", force: :cascade do |t|
    t.text     "fun_fact"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "film_locations", force: :cascade do |t|
    t.string   "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "films", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "full_business_data", force: :cascade do |t|
    t.string   "locationid"
    t.string   "business_account_number"
    t.string   "ownership_name"
    t.string   "dba_name"
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.string   "source_zipcode"
    t.string   "business_start_date"
    t.string   "business_end_date"
    t.string   "location_start_date"
    t.string   "location_end_date"
    t.string   "mail_address"
    t.string   "mail_city"
    t.string   "mail_zipcode"
    t.string   "mail_state"
    t.string   "naics_code"
    t.string   "naics_code_description"
    t.string   "parking_tax"
    t.string   "transient_occupancy_tax"
    t.string   "lic_code"
    t.string   "lic_code_description"
    t.string   "supervisor_district"
    t.string   "neighborhoods"
    t.string   "business_corridor"
    t.string   "business_location"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "full_film_location_data", force: :cascade do |t|
    t.string   "title"
    t.integer  "release_year"
    t.string   "locations"
    t.text     "fun_facts"
    t.string   "production_company"
    t.string   "distributor"
    t.string   "director"
    t.string   "writer"
    t.string   "actor1"
    t.string   "actor2"
    t.string   "actor3"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "full_park_data", force: :cascade do |t|
    t.string   "park_name"
    t.string   "park_type"
    t.string   "park_service_area"
    t.string   "psa_manager"
    t.string   "email"
    t.string   "number"
    t.string   "zipcode"
    t.float    "acreage"
    t.integer  "sup_dist"
    t.integer  "parkid"
    t.string   "location"
    t.string   "lat"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "lics", force: :cascade do |t|
    t.string   "code"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_locations_on_user_id", using: :btree
  end

  create_table "maps", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "naics", force: :cascade do |t|
    t.string   "code"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "park_area_dists", force: :cascade do |t|
    t.string   "park_service_area"
    t.integer  "sup_dist"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "park_locations", force: :cascade do |t|
    t.integer  "zipcode"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.float    "latitude"
    t.float    "longitude"
    t.string   "address"
    t.integer  "park_zipcode_id"
    t.index ["park_zipcode_id"], name: "index_park_locations_on_park_zipcode_id", using: :btree
  end

  create_table "park_psa_managers", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "park_zipcodes", force: :cascade do |t|
    t.integer  "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parks", force: :cascade do |t|
    t.string   "name"
    t.float    "acreage"
    t.integer  "old_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "park_area_dist_id"
    t.integer  "park_location_id"
    t.integer  "park_psa_manager_id"
    t.index ["park_area_dist_id"], name: "index_parks_on_park_area_dist_id", using: :btree
    t.index ["park_location_id"], name: "index_parks_on_park_location_id", using: :btree
    t.index ["park_psa_manager_id"], name: "index_parks_on_park_psa_manager_id", using: :btree
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
    t.string   "username"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree
  end

  add_foreign_key "film_and_film_fun_facts", "film_fun_facts"
  add_foreign_key "film_and_film_fun_facts", "films"
  add_foreign_key "film_and_film_locations", "film_locations"
  add_foreign_key "film_and_film_locations", "films"
  add_foreign_key "locations", "users"
  add_foreign_key "park_locations", "park_zipcodes"
  add_foreign_key "parks", "park_area_dists"
  add_foreign_key "parks", "park_locations"
  add_foreign_key "parks", "park_psa_managers"
end
