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

ActiveRecord::Schema[7.0].define(version: 2023_11_30_060113) do
  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "color", default: "#DCDDDD"
    t.integer "average_calorie"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "title"
    t.integer "rate", default: 5
    t.text "comment_body"
    t.integer "meal_log_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meal_logs", force: :cascade do |t|
    t.datetime "Eat_date"
    t.string "Meal_name"
    t.text "Meal_description"
    t.integer "Calorie"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "category_id", default: 1, null: false
    t.integer "user_id"
    t.string "image"
    t.index ["category_id"], name: "index_meal_logs_on_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "uid"
    t.string "provider"
    t.string "token"
  end

  add_foreign_key "meal_logs", "categories"
end
