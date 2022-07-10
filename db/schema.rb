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

ActiveRecord::Schema.define(version: 2022_07_08_141634) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "contests", force: :cascade do |t|
    t.string "name_school"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_contests_on_user_id"
  end

  create_table "inventories", force: :cascade do |t|
    t.integer "stock"
    t.integer "price"
    t.integer "inventoryable_id"
    t.string "inventoryable_type"
    t.integer "sold_quantity", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "list_contests", force: :cascade do |t|
    t.string "title"
    t.integer "type_pmr"
    t.integer "type_contest"
    t.text "value_format"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "member_contests", force: :cascade do |t|
    t.string "school"
    t.string "code"
    t.string "helper_1"
    t.string "helper_2"
    t.string "helper_3"
    t.bigint "contest_id"
    t.bigint "list_contest_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["contest_id"], name: "index_member_contests_on_contest_id"
    t.index ["list_contest_id"], name: "index_member_contests_on_list_contest_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "member_contest_id"
    t.bigint "inventory_id"
    t.integer "price", default: 0
    t.integer "quantity", default: 1
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["inventory_id"], name: "index_order_items_on_inventory_id"
    t.index ["member_contest_id"], name: "index_order_items_on_member_contest_id"
    t.index ["order_id"], name: "index_order_items_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "status"
    t.integer "total_payment", default: 0
    t.integer "remaining_payment", default: 0
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.text "avatar_data"
    t.integer "payment", default: 0
    t.boolean "confirmable", default: false
    t.text "reason"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "payments"
    t.index ["order_id"], name: "index_payments_on_order_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "user_id"
    t.string "school"
    t.string "name"
    t.string "phone"
    t.integer "type_pmr"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "value_formats", force: :cascade do |t|
    t.text "value_format"
    t.bigint "member_contest_id"
    t.bigint "list_contest_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["list_contest_id"], name: "index_value_formats_on_list_contest_id"
    t.index ["member_contest_id"], name: "index_value_formats_on_member_contest_id"
  end

  add_foreign_key "payments", "orders"
end
