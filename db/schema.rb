# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150302164106) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: true do |t|
    t.integer  "task_id"
    t.string   "response"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "question_id"
  end

  add_index "answers", ["task_id"], name: "index_answers_on_task_id", using: :btree

  create_table "devices", force: true do |t|
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.integer  "user_id"
    t.decimal  "lat",        precision: 10, scale: 6
    t.decimal  "lng",        precision: 10, scale: 6
    t.decimal  "heading",    precision: 6,  scale: 3
    t.integer  "task_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["task_id"], name: "index_events_on_task_id", using: :btree
  add_index "events", ["user_id"], name: "index_events_on_user_id", using: :btree

  create_table "food_reports", force: true do |t|
    t.decimal  "lat",        precision: 10, scale: 6
    t.decimal  "lon",        precision: 10, scale: 6
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: true do |t|
    t.string   "question_text"
    t.string   "question_options", default: [], array: true
    t.integer  "task_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sequence_num"
  end

  create_table "tasks", force: true do |t|
    t.decimal  "lat",             precision: 10, scale: 6
    t.decimal  "lng",             precision: 10, scale: 6
    t.string   "question"
    t.integer  "size"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "confirmed"
    t.string   "building"
    t.string   "floor_number"
    t.string   "food_drink"
    t.string   "food_type"
    t.string   "drink_type"
    t.string   "free_for_anyone"
  end

  create_table "toys", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "score",              default: 0
    t.string   "email"
    t.boolean  "food_notifications", default: true
    t.boolean  "verify_reports",     default: true
    t.boolean  "daily_reminders",    default: true
    t.integer  "device_id"
  end

  add_index "users", ["score"], name: "index_users_on_score", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", using: :btree

end
