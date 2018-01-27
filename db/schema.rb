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

ActiveRecord::Schema.define(version: 20180121111518) do

  create_table "class_courses", force: :cascade do |t|
    t.integer "classwork_id"
    t.integer "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "class_days", force: :cascade do |t|
    t.integer "classwork_id"
    t.string "week"
    t.time "start_time"
    t.time "finish_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "classworks", force: :cascade do |t|
    t.integer "user_id"
    t.string "classwork_post_code_first"
    t.string "classwork_post_code_last"
    t.integer "region_id"
    t.string "classwork_city"
    t.string "classwork_street"
    t.string "classwork_phone"
    t.string "classwork_email"
    t.text "classwork_pr"
    t.boolean "state", default: true, null: false
    t.string "teacher_image_id"
    t.text "career"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string "course"
    t.integer "price"
    t.text "explanatory_text"
    t.string "target_age"
    t.string "class_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.integer "classwork_id"
    t.string "customer_first_name"
    t.string "customer_last_name"
    t.string "customer_first_name_kana"
    t.string "customer_last_name_kana"
    t.integer "sex", limit: 1, default: 0, null: false
    t.string "age"
    t.integer "course_id"
    t.string "post_code"
    t.integer "region_id"
    t.string "city"
    t.string "street"
    t.string "phone"
    t.string "email"
    t.integer "contact"
    t.integer "pc", limit: 1, default: 0, null: false
    t.string "parents_first_name"
    t.string "parents_last_name"
    t.string "parents_first_name_kana"
    t.string "parents_last_name_kana"
    t.text "remarks"
    t.integer "correspondence", limit: 1, default: 0, null: false
    t.boolean "customer_status", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "infos", force: :cascade do |t|
    t.text "info_contents"
    t.text "create_day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "regions", force: :cascade do |t|
    t.string "region"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "user_id"
    t.integer "student_status", limit: 1, default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_customers", force: :cascade do |t|
    t.integer "user_id"
    t.integer "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string "first_name"
    t.string "last_name"
    t.string "first_name_kana"
    t.string "last_name_kana"
    t.string "post_code"
    t.integer "region_id"
    t.string "city"
    t.string "street"
    t.string "phone"
    t.boolean "user_status", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
