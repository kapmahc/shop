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

ActiveRecord::Schema.define(version: 20161206155101) do

  create_table "shop_addresses", force: :cascade do |t|
    t.string   "full_name",              null: false
    t.string   "content",                null: false
    t.string   "phone",                  null: false
    t.string   "zip_code",     limit: 8, null: false
    t.string   "country_code", limit: 3, null: false
    t.integer  "user_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["content"], name: "index_shop_addresses_on_content"
    t.index ["country_code"], name: "index_shop_addresses_on_country_code"
    t.index ["full_name"], name: "index_shop_addresses_on_full_name"
    t.index ["phone"], name: "index_shop_addresses_on_phone"
    t.index ["user_id"], name: "index_shop_addresses_on_user_id"
    t.index ["zip_code"], name: "index_shop_addresses_on_zip_code"
  end

  create_table "shop_chargebacks", force: :cascade do |t|
    t.string   "state",           limit: 16,                 null: false
    t.integer  "amount_cents",               default: 0,     null: false
    t.string   "amount_currency",            default: "USD", null: false
    t.integer  "operator_id"
    t.integer  "shop_order_id"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.index ["shop_order_id"], name: "index_shop_chargebacks_on_shop_order_id"
    t.index ["state"], name: "index_shop_chargebacks_on_state"
  end

  create_table "shop_comments", force: :cascade do |t|
    t.text     "body",            null: false
    t.integer  "point",           null: false
    t.integer  "shop_product_id"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["shop_product_id"], name: "index_shop_comments_on_shop_product_id"
    t.index ["user_id"], name: "index_shop_comments_on_user_id"
  end

  create_table "shop_inventory_units", force: :cascade do |t|
    t.integer  "lock_version",                            null: false
    t.string   "state",                        limit: 16, null: false
    t.integer  "shop_order_id"
    t.integer  "shop_variant_id"
    t.integer  "shop_shipment_id"
    t.integer  "shop_return_authorization_id"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.index ["shop_order_id"], name: "index_shop_inventory_units_on_shop_order_id"
    t.index ["shop_return_authorization_id"], name: "index_shop_inventory_units_on_shop_return_authorization_id"
    t.index ["shop_shipment_id"], name: "index_shop_inventory_units_on_shop_shipment_id"
    t.index ["shop_variant_id"], name: "index_shop_inventory_units_on_shop_variant_id"
    t.index ["state"], name: "index_shop_inventory_units_on_state"
  end

  create_table "shop_line_items", force: :cascade do |t|
    t.integer  "quantity",                        null: false
    t.integer  "price_cents",     default: 0,     null: false
    t.string   "price_currency",  default: "USD", null: false
    t.integer  "shop_variant_id"
    t.integer  "shop_order_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["shop_order_id"], name: "index_shop_line_items_on_shop_order_id"
    t.index ["shop_variant_id"], name: "index_shop_line_items_on_shop_variant_id"
  end

  create_table "shop_orders", force: :cascade do |t|
    t.string   "uid",                       limit: 36,                 null: false
    t.string   "state",                     limit: 8,                  null: false
    t.string   "shipment_state",            limit: 8,                  null: false
    t.string   "payment_state",             limit: 8,                  null: false
    t.string   "address",                                              null: false
    t.integer  "item_total_cents",                     default: 0,     null: false
    t.string   "item_total_currency",                  default: "USD", null: false
    t.integer  "total_cents",                          default: 0,     null: false
    t.string   "total_currency",                       default: "USD", null: false
    t.integer  "adjustment_total_cents",               default: 0,     null: false
    t.string   "adjustment_total_currency",            default: "USD", null: false
    t.integer  "payment_total_cents",                  default: 0,     null: false
    t.string   "payment_total_currency",               default: "USD", null: false
    t.integer  "user_id"
    t.datetime "completed_at"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.index ["payment_state"], name: "index_shop_orders_on_payment_state"
    t.index ["shipment_state"], name: "index_shop_orders_on_shipment_state"
    t.index ["state"], name: "index_shop_orders_on_state"
    t.index ["uid"], name: "index_shop_orders_on_uid", unique: true
    t.index ["user_id"], name: "index_shop_orders_on_user_id"
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

  create_table "shop_payments", force: :cascade do |t|
    t.string   "state",                  limit: 8,                 null: false
    t.string   "response_code"
    t.string   "avs_response"
    t.integer  "amount_cents",                     default: 0,     null: false
    t.string   "amount_currency",                  default: "USD", null: false
    t.integer  "shop_order_id"
    t.integer  "shop_payment_method_id"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.index ["shop_order_id"], name: "index_shop_payments_on_shop_order_id"
    t.index ["shop_payment_method_id"], name: "index_shop_payments_on_shop_payment_method_id"
    t.index ["state"], name: "index_shop_payments_on_state"
  end

  create_table "shop_products", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "description", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["name"], name: "index_shop_products_on_name"
  end

  create_table "shop_products_tags", id: false, force: :cascade do |t|
    t.integer "shop_product_id"
    t.integer "shop_tag_id"
    t.index ["shop_product_id", "shop_tag_id"], name: "idx_shop_products_tags", unique: true
    t.index ["shop_product_id"], name: "index_shop_products_tags_on_shop_product_id"
    t.index ["shop_tag_id"], name: "index_shop_products_tags_on_shop_tag_id"
  end

  create_table "shop_return_authorizations", force: :cascade do |t|
    t.string   "tracking",                                           null: false
    t.string   "uid",                                                null: false
    t.string   "state",                   limit: 16,                 null: false
    t.integer  "amount_cents",                       default: 0,     null: false
    t.string   "amount_currency",                    default: "USD", null: false
    t.text     "reason",                                             null: false
    t.integer  "enter_by"
    t.datetime "enter_at"
    t.integer  "shop_order_id"
    t.integer  "shop_shipping_method_id"
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.index ["shop_order_id"], name: "index_shop_return_authorizations_on_shop_order_id"
    t.index ["shop_shipping_method_id"], name: "index_shop_return_authorizations_on_shop_shipping_method_id"
  end

  create_table "shop_shipments", force: :cascade do |t|
    t.string   "tracking",                                           null: false
    t.string   "uid",                                                null: false
    t.string   "state",                   limit: 16,                 null: false
    t.integer  "cost_cents",                         default: 0,     null: false
    t.string   "cost_currency",                      default: "USD", null: false
    t.datetime "shipped_at"
    t.integer  "shop_order_id"
    t.integer  "shop_shipping_method_id"
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.index ["shop_order_id"], name: "index_shop_shipments_on_shop_order_id"
    t.index ["shop_shipping_method_id"], name: "index_shop_shipments_on_shop_shipping_method_id"
    t.index ["uid"], name: "index_shop_shipments_on_uid", unique: true
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

  create_table "shop_tag_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id",   null: false
    t.integer "descendant_id", null: false
    t.integer "generations",   null: false
    t.index ["ancestor_id", "descendant_id", "generations"], name: "tag_anc_desc_idx", unique: true
    t.index ["descendant_id"], name: "tag_desc_idx"
  end

  create_table "shop_tags", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "parent_id"
    t.integer  "sort_order", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_shop_tags_on_name"
  end

  create_table "shop_variants", force: :cascade do |t|
    t.string   "sku",             limit: 36,                                          null: false
    t.decimal  "weight",                     precision: 12, scale: 2
    t.decimal  "height",                     precision: 12, scale: 2
    t.decimal  "width",                      precision: 12, scale: 2
    t.decimal  "length",                     precision: 12, scale: 2
    t.integer  "shop_product_id"
    t.datetime "created_at",                                                          null: false
    t.datetime "updated_at",                                                          null: false
    t.integer  "price_cents",                                         default: 0,     null: false
    t.string   "price_currency",                                      default: "USD", null: false
    t.index ["shop_product_id"], name: "index_shop_variants_on_shop_product_id"
    t.index ["sku"], name: "index_shop_variants_on_sku", unique: true
  end

end
