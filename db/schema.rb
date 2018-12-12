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

ActiveRecord::Schema.define(version: 20181212064726) do

  create_table "attributes", force: :cascade do |t|
    t.string "name"
    t.integer "rent_level"
    t.integer "is_criminal"
    t.integer "is_drunk"
    t.integer "is_ill"
    t.integer "hp"
    t.integer "money"
    t.string "guardian"
    t.boolean "is_mission_1"
    t.boolean "is_mission_2"
    t.boolean "is_mission_3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "endgrades", force: :cascade do |t|
    t.string "name"
    t.integer "rent_level"
    t.integer "is_criminal"
    t.integer "is_drunk"
    t.integer "is_ill"
    t.integer "hp"
    t.integer "money"
    t.string "guardian"
    t.boolean "is_kindhearted_landlord"
    t.boolean "is_mission_1"
    t.boolean "is_mission_2"
    t.boolean "is_mission_3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
