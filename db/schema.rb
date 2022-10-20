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

ActiveRecord::Schema[7.0].define(version: 2022_10_19_190923) do
  create_table "classrooms", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.boolean "enabled"
    t.integer "professor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "classrooms_users", id: false, force: :cascade do |t|
    t.integer "classroom_id"
    t.integer "user_id"
    t.index ["classroom_id"], name: "index_classrooms_users_on_classroom_id"
    t.index ["user_id"], name: "index_classrooms_users_on_user_id"
  end

  create_table "close_ended_questions", id: false, force: :cascade do |t|
    t.integer "question_id", null: false
    t.json "alternatives"
    t.string "correct_alternative"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_close_ended_questions_on_question_id"
  end

  create_table "exams", force: :cascade do |t|
    t.integer "classroom_id"
    t.text "name"
    t.text "description"
    t.datetime "start_date"
    t.datetime "due_date"
    t.boolean "duration"
    t.bigint "time_limit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["classroom_id"], name: "index_exams_on_classroom_id"
  end

  create_table "open_ended_questions", id: false, force: :cascade do |t|
    t.integer "question_id", null: false
    t.string "possible_reply"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_open_ended_questions_on_question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "description"
    t.integer "difficulty", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "close_ended_questions", "questions"
  add_foreign_key "exams", "classrooms"
  add_foreign_key "open_ended_questions", "questions"
end
