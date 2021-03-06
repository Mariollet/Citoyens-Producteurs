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

ActiveRecord::Schema.define(version: 2020_03_11_173236) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "place"
    t.string "zip_code"
    t.string "city"
    t.string "sector"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "appointments", force: :cascade do |t|
    t.datetime "start_date"
    t.integer "duration"
    t.string "status"
    t.integer "points"
    t.bigint "user_id"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_appointments_on_event_id"
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "blog_comments", force: :cascade do |t|
    t.text "text"
    t.bigint "user_id"
    t.bigint "blog_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blog_id"], name: "index_blog_comments_on_blog_id"
    t.index ["user_id"], name: "index_blog_comments_on_user_id"
  end

  create_table "blog_likes", force: :cascade do |t|
    t.integer "like"
    t.bigint "user_id"
    t.bigint "blog_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blog_id"], name: "index_blog_likes_on_blog_id"
    t.index ["user_id"], name: "index_blog_likes_on_user_id"
  end

  create_table "blogs", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_blogs_on_user_id"
  end

  create_table "blogs_comments", force: :cascade do |t|
    t.text "text"
    t.bigint "user_id"
    t.bigint "blog_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blog_id"], name: "index_blogs_comments_on_blog_id"
    t.index ["user_id"], name: "index_blogs_comments_on_user_id"
  end

  create_table "blogs_likes", force: :cascade do |t|
    t.integer "like"
    t.bigint "user_id"
    t.bigint "blog_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blog_id"], name: "index_blogs_likes_on_blog_id"
    t.index ["user_id"], name: "index_blogs_likes_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "text"
    t.bigint "user_id"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_comments_on_event_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "event_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.bigint "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "address_id"
    t.bigint "event_type_id"
    t.boolean "is_passed", default: false
    t.index ["address_id"], name: "index_events_on_address_id"
    t.index ["creator_id"], name: "index_events_on_creator_id"
    t.index ["event_type_id"], name: "index_events_on_event_type_id"
  end

  create_table "feedbacks", force: :cascade do |t|
    t.text "content"
    t.integer "rating"
    t.string "feedbackable_type"
    t.bigint "feedbackable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feedbackable_type", "feedbackable_id"], name: "index_feedbacks_on_feedbackable_type_and_feedbackable_id"
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "blog_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blog_id"], name: "index_likes_on_blog_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "product_appointments", force: :cascade do |t|
    t.integer "quantity"
    t.bigint "product_id"
    t.bigint "appointment_id"
    t.bigint "unit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["appointment_id"], name: "index_product_appointments_on_appointment_id"
    t.index ["product_id"], name: "index_product_appointments_on_product_id"
    t.index ["unit_id"], name: "index_product_appointments_on_unit_id"
  end

  create_table "product_events", force: :cascade do |t|
    t.integer "quantity"
    t.bigint "product_id"
    t.bigint "event_id"
    t.bigint "unit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_product_events_on_event_id"
    t.index ["product_id"], name: "index_product_events_on_product_id"
    t.index ["unit_id"], name: "index_product_events_on_unit_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "store_products", force: :cascade do |t|
    t.integer "quantity"
    t.bigint "product_id"
    t.bigint "store_id"
    t.bigint "unit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_store_products_on_product_id"
    t.index ["store_id"], name: "index_store_products_on_store_id"
    t.index ["unit_id"], name: "index_store_products_on_unit_id"
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.bigint "address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_stores_on_address_id"
  end

  create_table "units", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string "phone_number"
    t.bigint "address_id"
    t.bigint "store_id"
    t.boolean "is_admin", default: false
    t.boolean "has_payed", default: false
    t.string "avatar", default: "avatar_1.png"
    t.index ["address_id"], name: "index_users_on_address_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["store_id"], name: "index_users_on_store_id"
  end

  add_foreign_key "appointments", "events"
  add_foreign_key "appointments", "users"
  add_foreign_key "blog_comments", "blogs"
  add_foreign_key "blog_comments", "users"
  add_foreign_key "blog_likes", "blogs"
  add_foreign_key "blog_likes", "users"
  add_foreign_key "blogs", "users"
  add_foreign_key "blogs_comments", "blogs"
  add_foreign_key "blogs_comments", "users"
  add_foreign_key "blogs_likes", "blogs"
  add_foreign_key "blogs_likes", "users"
  add_foreign_key "comments", "events"
  add_foreign_key "comments", "users"
  add_foreign_key "events", "addresses"
  add_foreign_key "events", "event_types"
  add_foreign_key "events", "users", column: "creator_id"
  add_foreign_key "likes", "blogs"
  add_foreign_key "likes", "users"
  add_foreign_key "product_appointments", "appointments"
  add_foreign_key "product_appointments", "products"
  add_foreign_key "product_appointments", "units"
  add_foreign_key "product_events", "events"
  add_foreign_key "product_events", "products"
  add_foreign_key "product_events", "units"
  add_foreign_key "store_products", "products"
  add_foreign_key "store_products", "stores"
  add_foreign_key "store_products", "units"
  add_foreign_key "stores", "addresses"
  add_foreign_key "users", "addresses"
  add_foreign_key "users", "stores"
end
