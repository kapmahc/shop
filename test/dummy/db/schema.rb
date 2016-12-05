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

ActiveRecord::Schema.define(version: 20161125001325) do

  create_table "shop_addresses", force: :cascade do |t|
    t.string   "full_name",               null: false
    t.string   "address1",                null: false
    t.string   "address2",                null: false
    t.string   "phone",                   null: false
    t.string   "zip_code",      limit: 8, null: false
    t.string   "country",                 null: false
    t.string   "state",                   null: false
    t.string   "city",                    null: false
    t.integer  "shop_state_id"
    t.integer  "user_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["address1"], name: "index_shop_addresses_on_address1"
    t.index ["city"], name: "index_shop_addresses_on_city"
    t.index ["country"], name: "index_shop_addresses_on_country"
    t.index ["full_name"], name: "index_shop_addresses_on_full_name"
    t.index ["phone"], name: "index_shop_addresses_on_phone"
    t.index ["shop_state_id"], name: "index_shop_addresses_on_shop_state_id"
    t.index ["state"], name: "index_shop_addresses_on_state"
    t.index ["user_id"], name: "index_shop_addresses_on_user_id"
    t.index ["zip_code"], name: "index_shop_addresses_on_zip_code"
  end

  create_table "shop_countries", force: :cascade do |t|
    t.string   "name",                                       null: false
    t.string   "alpha_2",         limit: 2,                  null: false
    t.string   "alpha_3",         limit: 3,                  null: false
    t.string   "code",            limit: 3,                  null: false
    t.string   "iso3166_2",       limit: 16,                 null: false
    t.string   "region",          limit: 16,                 null: false
    t.string   "sub_region",      limit: 32,                 null: false
    t.string   "region_code",     limit: 3,                  null: false
    t.string   "sub_region_code", limit: 3,                  null: false
    t.boolean  "active",                     default: false, null: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.index ["alpha_2"], name: "index_shop_countries_on_alpha_2"
    t.index ["alpha_3"], name: "index_shop_countries_on_alpha_3"
    t.index ["code"], name: "index_shop_countries_on_code"
    t.index ["iso3166_2"], name: "index_shop_countries_on_iso3166_2"
    t.index ["name"], name: "index_shop_countries_on_name", unique: true
    t.index ["region"], name: "index_shop_countries_on_region"
    t.index ["region_code"], name: "index_shop_countries_on_region_code"
    t.index ["sub_region"], name: "index_shop_countries_on_sub_region"
    t.index ["sub_region_code"], name: "index_shop_countries_on_sub_region_code"
  end

  create_table "shop_currencies", force: :cascade do |t|
    t.string   "cid",        limit: 3,                                          null: false
    t.string   "code",       limit: 3,                                          null: false
    t.string   "name",                                                          null: false
    t.string   "country",                                                       null: false
    t.decimal  "rate",                 precision: 12, scale: 4
    t.string   "units",      limit: 8,                                          null: false
    t.boolean  "active",                                        default: false, null: false
    t.datetime "created_at",                                                    null: false
    t.datetime "updated_at",                                                    null: false
  end

  create_table "shop_payment_methods", force: :cascade do |t|
    t.string   "name",                                           null: false
    t.string   "flag",                 limit: 8,                 null: false
    t.text     "description"
    t.text     "encrypted_profile"
    t.string   "encrypted_profile_iv"
    t.boolean  "active",                         default: false, null: false
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.index ["name"], name: "index_shop_payment_methods_on_name", unique: true
  end

  create_table "shop_shipping_methods", force: :cascade do |t|
    t.string   "name",                                 null: false
    t.string   "tracking",                             null: false
    t.text     "description"
    t.text     "encrypted_profile"
    t.string   "encrypted_profile_iv"
    t.boolean  "active",               default: false, null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.index ["name"], name: "index_shop_shipping_methods_on_name", unique: true
  end

  create_table "shop_states", force: :cascade do |t|
    t.string   "name",            null: false
    t.integer  "shop_country_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["name", "shop_country_id"], name: "index_shop_states_on_name_and_shop_country_id", unique: true
    t.index ["shop_country_id"], name: "index_shop_states_on_shop_country_id"
  end

end
