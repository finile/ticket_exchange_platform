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

ActiveRecord::Schema.define(version: 20180620174809) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "articles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cart_items", force: :cascade do |t|
    t.integer "cart_id"
    t.integer "coupon_id", null: false
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "railticket_id"
    t.integer "cartable_id"
    t.string "cartable_type"
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comboards", force: :cascade do |t|
    t.date "flight_date_from"
    t.date "flight_date_to"
    t.string "departure"
    t.string "destination"
    t.string "name"
    t.integer "price"
    t.text "content"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "ticket_id"
    t.integer "railticket_id"
    t.integer "commentable_id"
    t.string "commentable_type"
    t.integer "coupon_id"
    t.integer "board_id"
  end

  create_table "coupons", force: :cascade do |t|
    t.string "airline"
    t.string "destination"
    t.date "coupon_expiry_date"
    t.date "flight_date_from"
    t.date "flight_date_to"
    t.string "tax"
    t.string "image"
    t.text "others"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "favorites_count", default: 0
    t.integer "quantity"
    t.integer "price"
    t.string "departure"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "ticket_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "railticket_id"
    t.integer "coupon_id"
    t.integer "parkticket_id"
  end

  create_table "metros", force: :cascade do |t|
    t.string "ticket_type"
    t.integer "days"
    t.date "expire_date"
    t.string "area"
    t.integer "price"
    t.string "image"
    t.text "others"
    t.integer "favorites_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "quantity"
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "order_id"
    t.integer "coupon_id"
    t.integer "price"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "sn"
    t.integer "amount"
    t.integer "user_id"
    t.string "name"
    t.string "phone"
    t.string "address"
    t.string "payment_status", default: "not_paid"
    t.string "shipping_status", default: "not_shipped"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parktickets", force: :cascade do |t|
    t.string "park_name"
    t.datetime "park_expiry_date"
    t.integer "price"
    t.integer "quantity"
    t.string "image"
    t.text "others"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "favorites_count", default: 0
  end

  create_table "payments", force: :cascade do |t|
    t.integer "order_id"
    t.integer "sn", null: false
    t.string "payment_method"
    t.integer "amount"
    t.datetime "paid_at"
    t.text "params"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "rail_order_id"
  end

  create_table "rail_cart_items", force: :cascade do |t|
    t.integer "rail_cart_id"
    t.integer "railticket_id", null: false
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rail_carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rail_order_items", force: :cascade do |t|
    t.integer "rail_order_id"
    t.integer "railticket_id"
    t.integer "price"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rail_orders", force: :cascade do |t|
    t.integer "sn"
    t.integer "amount"
    t.integer "user_id"
    t.string "name"
    t.string "phone"
    t.string "address"
    t.string "rail_payment_status", default: "not_paid"
    t.string "rail_shipping_status", default: "not_shipped"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "railtickets", force: :cascade do |t|
    t.string "train_no"
    t.date "train_date"
    t.time "departure_time"
    t.time "arrive_time"
    t.string "departure"
    t.string "destination"
    t.string "name"
    t.integer "price"
    t.integer "discount"
    t.string "image"
    t.text "others"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "favorites_count", default: 0
    t.integer "quantity"
  end

  create_table "searches", force: :cascade do |t|
    t.string "airline"
    t.string "flight_no"
    t.date "date_from"
    t.date "date_to"
    t.integer "min_price"
    t.integer "max_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "destination"
    t.string "train_no"
    t.string "departure"
    t.string "ticket_type"
    t.string "days"
    t.string "area"
    t.date "expire_date"
    t.string "park_name"
    t.datetime "park_expiry_date"
  end

  create_table "tickets", force: :cascade do |t|
    t.string "airline"
    t.string "flight_no"
    t.date "flight_date"
    t.time "flight_time"
    t.string "departure"
    t.string "destination"
    t.string "name"
    t.integer "price"
    t.string "image"
    t.text "others"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantity"
    t.integer "user_id"
    t.integer "favorites_count", default: 0
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "fb_uid"
    t.string "fb_token"
    t.integer "tickets_count", default: 0
    t.integer "coupons_count", default: 0
    t.integer "railtickets_count", default: 0
    t.integer "favorites_count", default: 0
    t.string "address"
    t.string "phone"
    t.integer "parktickets_count", default: 0
    t.integer "metros_count", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
