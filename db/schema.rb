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

ActiveRecord::Schema.define(version: 20140715043120) do

  create_table "task_users", force: true do |t|
    t.integer  "task_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "task_users", ["task_id"], name: "index_task_users_on_task_id", using: :btree
  add_index "task_users", ["user_id"], name: "index_task_users_on_user_id", using: :btree

  create_table "tasks", force: true do |t|
    t.string   "task_name"
    t.text     "description"
    t.integer  "points"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password"
    t.string   "email"
    t.string   "auth_token"
    t.integer  "points"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
