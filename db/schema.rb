# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_12_03_015433) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cancelled_feedbacks", force: :cascade do |t|
    t.string "description"
    t.string "problem_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "service_technician_id", null: false
    t.datetime "start"
    t.datetime "end"
    t.string "status"
    t.bigint "tip_id", null: false
    t.bigint "cancelled_feedback_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cancelled_feedback_id"], name: "index_orders_on_cancelled_feedback_id"
    t.index ["service_technician_id"], name: "index_orders_on_service_technician_id"
    t.index ["tip_id"], name: "index_orders_on_tip_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "services", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.string "description"
    t.bigint "technician_id_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_services_on_category_id"
    t.index ["technician_id_id"], name: "index_services_on_technician_id_id"
  end

  create_table "services_technicians", force: :cascade do |t|
    t.bigint "service_id", null: false
    t.bigint "user_id", null: false
    t.float "fee_amount"
    t.string "fee_currency"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["service_id"], name: "index_services_technicians_on_service_id"
    t.index ["user_id"], name: "index_services_technicians_on_user_id"
  end

  create_table "tips", force: :cascade do |t|
    t.float "amount"
    t.string "currency"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "role"
    t.string "status"
    t.text "bio"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "orders", "cancelled_feedbacks"
  add_foreign_key "orders", "services_technicians", column: "service_technician_id"
  add_foreign_key "orders", "tips"
  add_foreign_key "orders", "users"
  add_foreign_key "services", "categories"
  add_foreign_key "services", "users", column: "technician_id_id"
  add_foreign_key "services_technicians", "services"
  add_foreign_key "services_technicians", "users"
end
