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

ActiveRecord::Schema[7.0].define(version: 2023_03_07_132912) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "baskets", force: :cascade do |t|
    t.integer "status", default: 0
    t.integer "final_price"
    t.bigint "prescription_id", null: false
    t.bigint "pharmacy_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pharmacy_id"], name: "index_baskets_on_pharmacy_id"
    t.index ["prescription_id"], name: "index_baskets_on_prescription_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "desc"
    t.integer "price"
    t.boolean "drug", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "quantity"
    t.bigint "basket_id", null: false
    t.bigint "item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["basket_id"], name: "index_orders_on_basket_id"
    t.index ["item_id"], name: "index_orders_on_item_id"
  end

  create_table "pharmacies", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prescription_items", force: :cascade do |t|
    t.string "posology"
    t.bigint "prescription_id", null: false
    t.bigint "item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_prescription_items_on_item_id"
    t.index ["prescription_id"], name: "index_prescription_items_on_prescription_id"
  end

  create_table "prescriptions", force: :cascade do |t|
    t.date "date"
    t.integer "status"
    t.bigint "doctor_id", null: false
    t.bigint "patient_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_prescriptions_on_doctor_id"
    t.index ["patient_id"], name: "index_prescriptions_on_patient_id"
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
    t.string "address"
    t.string "ssn"
    t.string "mutuelle_name"
    t.string "mutuelle_number"
    t.string "rpps"
    t.boolean "doctor", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "baskets", "pharmacies"
  add_foreign_key "baskets", "prescriptions"
  add_foreign_key "orders", "baskets"
  add_foreign_key "orders", "items"
  add_foreign_key "prescription_items", "items"
  add_foreign_key "prescription_items", "prescriptions"
  add_foreign_key "prescriptions", "users", column: "doctor_id"
  add_foreign_key "prescriptions", "users", column: "patient_id"
end
