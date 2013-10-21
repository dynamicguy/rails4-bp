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

ActiveRecord::Schema.define(version: 20131021170336) do

  create_table "articles", force: true do |t|
    t.string   "name"
    t.string   "content"
    t.datetime "published_on"
    t.integer  "author_id",                               null: false
    t.boolean  "public",                  default: false, null: false
    t.boolean  "guid",                                    null: false
    t.boolean  "pending",                 default: false, null: false
    t.string   "type",         limit: 40,                 null: false
    t.text     "text"
    t.integer  "likes_count",             default: 0
    t.boolean  "favorite",                default: false
  end

  create_table "categories", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.text     "secret_field"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cities", force: true do |t|
    t.string  "name",        limit: 35, default: "", null: false
    t.string  "countrycode", limit: 3,  default: "", null: false
    t.string  "district",    limit: 20, default: "", null: false
    t.integer "population",             default: 0,  null: false
  end

  add_index "cities", ["countrycode"], name: "countrycode", using: :btree

  create_table "company", primary_key: "comp_id", force: true do |t|
    t.string  "comp_name"
    t.integer "status"
    t.boolean "hidden"
    t.integer "created_time"
    t.integer "modified_time"
    t.string  "created_uid"
    t.string  "modified_uid"
    t.integer "global_admin"
    t.string  "website"
    t.string  "phone"
    t.integer "ssl"
  end

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
    t.string  "countrycode",                          default: "",  null: false
    t.string  "language",                             default: "",  null: false
    t.string  "isofficial",                           default: "0"
    t.decimal "percentage",  precision: 10, scale: 0, default: 0
  end

  add_index "countrylanguages", ["countrycode"], name: "index_countrylanguages_on_countrycode", using: :btree
  add_index "countrylanguages", ["language", "countrycode"], name: "index_countrylanguages_on_language_and_countrycode", using: :btree

  create_table "crews", force: true do |t|
    t.integer  "age"
    t.string   "name"
    t.string   "avatar"
    t.string   "title"
    t.string   "species"
    t.string   "origin"
    t.string   "quote"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.text     "secret_field"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "person_id"
    t.string   "state",        default: "draft"
  end

  create_table "profiles", force: true do |t|
    t.string   "first_name",       limit: 127
    t.string   "last_name",        limit: 127
    t.string   "image_url"
    t.string   "image_url_small"
    t.string   "image_url_medium"
    t.date     "birthday"
    t.string   "gender"
    t.text     "bio"
    t.boolean  "searchable",                   default: true,  null: false
    t.integer  "user_id",                                      null: false
    t.string   "location"
    t.string   "full_name",        limit: 70
    t.boolean  "nsfw",                         default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "profiles", ["full_name"], name: "index_profiles_on_full_name", using: :btree
  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "project", primary_key: "prj_id", force: true do |t|
    t.string  "prj_name"
    t.string  "site_address"
    t.integer "start_topic"
    t.integer "created_time"
    t.integer "modified_time"
    t.string  "created_uid"
    t.string  "modified_uid"
    t.boolean "master"
    t.string  "domain"
    t.boolean "private"
    t.boolean "keyword_index"
    t.string  "theme"
    t.string  "token"
    t.string  "default_view"
    t.boolean "user_view"
    t.boolean "show_folder_icon"
    t.boolean "show_page_icon"
    t.string  "toc_font_size"
    t.string  "toc_line_height"
    t.integer "primary_site"
    t.string  "lang"
    t.boolean "is_primary_lang"
    t.boolean "link_lang_sites"
    t.boolean "ckfinder_delete"
    t.string  "favicon"
    t.boolean "toc_visible"
    t.boolean "filter_visible"
    t.integer "toc_width"
    t.string  "toc_bg_color"
    t.boolean "toc_bold_folder"
    t.string  "toc_font_family"
    t.boolean "enable_mobile"
    t.string  "phone_home"
    t.boolean "tablet_home"
    t.boolean "enable_mobile_css"
  end

  create_table "rails_admin_histories", force: true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      limit: 2
    t.integer  "year",       limit: 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], name: "index_rails_admin_histories", using: :btree

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "site_settings", force: true do |t|
    t.string   "name"
    t.integer  "data_type"
    t.text     "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: true do |t|
    t.string "name"
  end

  create_table "users", force: true do |t|
    t.string   "email",                            default: "",   null: false
    t.string   "encrypted_password",               default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                    default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",                  default: 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "language",               limit: 2, default: "en"
    t.string   "gender"
    t.string   "name"
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true, using: :btree
  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  create_table "versions", force: true do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

end
