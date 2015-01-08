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

ActiveRecord::Schema.define(version: 20150107000218) do

  create_table "addresses", force: true do |t|
    t.string   "street_name", limit: 100
    t.string   "apt"
    t.string   "state_abbrv", limit: 2
    t.string   "city",        limit: 50
    t.string   "zip_code",    limit: 5
    t.integer  "user_id",                 null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "addresses", ["user_id"], name: "index_addresses_on_user_id"

  create_table "comments", force: true do |t|
    t.string   "comment"
    t.integer  "user_id"
    t.integer  "walker_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dogs", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "dogs", ["user_id"], name: "index_dogs_on_user_id"

  create_table "levels", force: true do |t|
    t.string   "name"
    t.integer  "number_of_dogs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name",                          null: false
    t.string   "last_name",                           null: false
    t.string   "credit_card",                         null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "credit_card_type"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "walkers", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "level_id"
    t.float    "price"
    t.integer  "address_id"
    t.integer  "comment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "walkers", ["address_id"], name: "index_walkers_on_address_id"
  add_index "walkers", ["comment_id"], name: "index_walkers_on_comment_id"

  create_table "walks", force: true do |t|
    t.integer  "dog_id"
    t.integer  "walker_id"
    t.integer  "created_by"
    t.integer  "time"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "walks", ["date"], name: "index_walks_on_date"
  add_index "walks", ["dog_id"], name: "index_walks_on_dog_id"
  add_index "walks", ["time"], name: "index_walks_on_time"
  add_index "walks", ["walker_id"], name: "index_walks_on_walker_id"

end
