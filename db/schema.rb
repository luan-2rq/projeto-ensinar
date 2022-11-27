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

ActiveRecord::Schema[7.0].define(version: 2022_11_27_021501) do
  create_table "classrooms", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.boolean "enabled"
    t.integer "professor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
  end

  create_table "classrooms_users", id: false, force: :cascade do |t|
    t.integer "classroom_id"
    t.integer "user_id"
    t.index ["classroom_id"], name: "index_classrooms_users_on_classroom_id"
    t.index ["user_id"], name: "index_classrooms_users_on_user_id"
  end

  create_table "close_ended_questions", force: :cascade do |t|
    t.integer "exam_id"
    t.text "description"
    t.string "difficulty"
    t.text "alternative_a"
    t.text "alternative_b"
    t.text "alternative_c"
    t.text "alternative_d"
    t.integer "correct_alternative"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exam_id"], name: "index_close_ended_questions_on_exam_id"
  end

  create_table "close_ended_replies", force: :cascade do |t|
    t.integer "user_id"
    t.integer "exam_id"
    t.integer "reply"
    t.boolean "correct"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exam_id"], name: "index_close_ended_replies_on_exam_id"
    t.index ["user_id"], name: "index_close_ended_replies_on_user_id"
  end

  create_table "exams", force: :cascade do |t|
    t.integer "classroom_id"
    t.text "name"
    t.text "description"
    t.datetime "start_date"
    t.datetime "due_date"
    t.boolean "duration"
    t.integer "time_limit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "code"
    t.integer "user_id", null: false
    t.index ["classroom_id"], name: "index_exams_on_classroom_id"
    t.index ["user_id"], name: "index_exams_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", default: "", null: false
    t.string "profile"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "close_ended_questions", "exams"
  add_foreign_key "close_ended_replies", "exams"
  add_foreign_key "close_ended_replies", "users"
  add_foreign_key "exams", "classrooms"
  add_foreign_key "exams", "users"
end
