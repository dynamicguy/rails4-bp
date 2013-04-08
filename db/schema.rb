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

ActiveRecord::Schema.define(version: 20130407091852) do

  create_table "articles", force: true do |t|
    t.string   "name"
    t.string   "content"
    t.datetime "published_on"
  end

  create_table "cities", force: true do |t|
    t.string  "name",        limit: 35, default: "", null: false
    t.string  "countrycode", limit: 3,  default: "", null: false
    t.string  "district",    limit: 20, default: "", null: false
    t.integer "population",             default: 0,  null: false
  end

  add_index "cities", ["countrycode"], name: "countrycode"

  create_table "countries", primary_key: "code", force: true do |t|
    t.string  "name",           limit: 52, default: "",     null: false
    t.string  "continent",      limit: 13, default: "asia", null: false
    t.string  "region",         limit: 26, default: "",     null: false
    t.float   "surfacearea",               default: 0.0,    null: false
    t.integer "indepyear",      limit: 2
    t.integer "population",                default: 0,      null: false
    t.float   "lifeexpectancy"
    t.float   "gnp"
    t.float   "gnpold"
    t.string  "localname",      limit: 45, default: "",     null: false
    t.string  "governmentform", limit: 45, default: "",     null: false
    t.string  "headofstate",    limit: 60
    t.integer "capital"
    t.string  "code2",          limit: 2,  default: "",     null: false
  end

  create_table "countrylanguages", id: false, force: true do |t|
    t.string "countrycode", limit: 3,  default: "",  null: false
    t.string "language",    limit: 30, default: "",  null: false
    t.string "isofficial",  limit: 1,  default: "f", null: false
    t.float  "percentage",             default: 0.0, null: false
  end

  add_index "countrylanguages", ["countrycode"], name: "countrycode"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true
  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true

end
