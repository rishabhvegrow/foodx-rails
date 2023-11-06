# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2023_10_31_075540) do
  create_table "cart_items", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "food_item_id", null: false
    t.integer "quantity"
    t.float "price", null: false
    t.integer "transaction_id"
    t.boolean "is_checked_out", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["food_item_id"], name: "index_cart_items_on_food_item_id"
    t.index ["transaction_id"], name: "index_cart_items_on_transaction_id"
    t.index ["user_id"], name: "index_cart_items_on_user_id"
  end

  create_table "food_items", force: :cascade do |t|
    t.string "name", null: false
    t.float "price", null: false
    t.string "description"
    t.integer "restaurant_id", null: false
    t.string "image_url", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_food_items_on_restaurant_id"
  end

  create_table "restaurents", force: :cascade do |t|
    t.string "name", null: false
    t.string "type", null: false
    t.string "address"
    t.string "contact", null: false
    t.float "rating"
    t.string "image_url", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.float "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_transactions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "address"
    t.string "contact", null: false
    t.string "password", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "cart_items", "food_items"
  add_foreign_key "cart_items", "users"
  add_foreign_key "food_items", "restaurants"
  add_foreign_key "transactions", "users"
end
