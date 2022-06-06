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

ActiveRecord::Schema[7.0].define(version: 2022_06_05_015621) do
  create_table "main_targets", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "target_main"
    t.string "target_n"
    t.string "target_ne"
    t.string "target_e"
    t.string "target_se"
    t.string "target_s"
    t.string "target_sw"
    t.string "target_w"
    t.string "target_nw"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_main_targets_on_user_id"
  end

  create_table "sub_targets", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "sub_target_n"
    t.string "sub_target_ne"
    t.string "sub_target_e"
    t.string "sub_target_se"
    t.string "sub_target_s"
    t.string "sub_target_sw"
    t.string "sub_target_w"
    t.string "sub_target_nw"
    t.bigint "main_target_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["main_target_id", "created_at"], name: "index_sub_targets_on_main_target_id_and_created_at"
    t.index ["main_target_id"], name: "index_sub_targets_on_main_target_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "main_targets", "users"
  add_foreign_key "sub_targets", "main_targets"
end
