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

ActiveRecord::Schema.define(version: 20130401102756) do

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

  create_table "countries", id: false, force: true do |t|
    t.string  "code"
    t.string  "name",                                                     null: false
    t.string  "continent",                               default: "Asia", null: false
    t.string  "region",                                  default: "",     null: false
    t.decimal "surfacearea",    precision: 10, scale: 0, default: 0,      null: false
    t.integer "indepyear",                               default: 0
    t.integer "population",                              default: 0,      null: false
    t.decimal "lifeexpectancy", precision: 10, scale: 0
    t.decimal "gnp",            precision: 10, scale: 0
    t.decimal "gnpold",         precision: 10, scale: 0
    t.string  "localname",                               default: "",     null: false
    t.string  "governmentform",                          default: "",     null: false
    t.string  "headofstate",                             default: ""
    t.integer "capital",                                 default: 0
    t.string  "code2",                                   default: "",     null: false
  end

  create_table "countrylanguages", id: false, force: true do |t|
    t.string  "countrycode"
    t.string  "language"
    t.boolean "isofficial",                           default: false
    t.decimal "percentage",  precision: 10, scale: 0, default: 0
  end

end
