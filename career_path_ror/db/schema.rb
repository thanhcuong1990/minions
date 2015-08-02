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

ActiveRecord::Schema.define(version: 20150802003550) do

  create_table "answers", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "results",    limit: 255, default: "--- []\n"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answers", ["user_id"], name: "index_answers_on_user_id", using: :btree

  create_table "careers", force: :cascade do |t|
    t.string   "name",           limit: 255,   default: "", null: false
    t.text     "description",    limit: 65535,              null: false
    t.integer  "personality_id", limit: 4,                  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "careers", ["name"], name: "index_careers_on_name", using: :btree

  create_table "personality_types", force: :cascade do |t|
    t.string   "name",        limit: 255,   null: false
    t.text     "description", limit: 65535, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "personality_types", ["name"], name: "index_personality_types_on_name", unique: true, using: :btree

  create_table "questions", force: :cascade do |t|
    t.string   "content",        limit: 255
    t.integer  "personality_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["content"], name: "index_questions_on_content", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",                limit: 255, default: "", null: false
    t.string   "email",               limit: 255, default: "", null: false
    t.string   "encrypted_password",  limit: 255, default: "", null: false
    t.string   "auth_token",          limit: 255, default: ""
    t.string   "string",              limit: 255, default: ""
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",  limit: 255
    t.string   "last_sign_in_ip",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["auth_token"], name: "index_users_on_auth_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
