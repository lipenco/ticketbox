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

ActiveRecord::Schema.define(version: 20140403021014) do

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pictures", force: true do |t|
    t.string   "url"
    t.integer  "ticket_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file"
  end

  add_index "pictures", ["ticket_id"], name: "index_pictures_on_ticket_id"

  create_table "tickets", force: true do |t|
    t.string   "name"
    t.date     "date"
    t.integer  "user_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tickets", ["category_id"], name: "index_tickets_on_category_id"
  add_index "tickets", ["user_id"], name: "index_tickets_on_user_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "uid"
    t.string   "provider"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
  end

end
