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

ActiveRecord::Schema.define(version: 20161121194407) do

  create_table "shop_countries", force: :cascade do |t|
    t.string   "name",                       null: false
    t.boolean  "active",     default: false, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["name"], name: "index_shop_countries_on_name", unique: true
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
    t.index ["cid"], name: "index_shop_currencies_on_cid"
    t.index ["code"], name: "index_shop_currencies_on_code"
    t.index ["country"], name: "index_shop_currencies_on_country"
    t.index ["name"], name: "index_shop_currencies_on_name"
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
    t.index ["flag"], name: "index_shop_payment_methods_on_flag"
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
    t.index ["name"], name: "index_shop_states_on_name"
    t.index ["shop_country_id"], name: "index_shop_states_on_shop_country_id"
  end

end
