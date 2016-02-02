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

ActiveRecord::Schema.define(version: 20160202194226) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pages", force: :cascade do |t|
    t.string   "title",                      null: false
    t.string   "body"
    t.string   "slug"
    t.integer  "parent_id"
    t.integer  "lft",                        null: false
    t.integer  "rgt",                        null: false
    t.integer  "depth",          default: 0, null: false
    t.integer  "children_count", default: 0, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "pages", ["lft"], name: "index_pages_on_lft", using: :btree
  add_index "pages", ["parent_id"], name: "index_pages_on_parent_id", using: :btree
  add_index "pages", ["rgt"], name: "index_pages_on_rgt", using: :btree

  create_table "uploads", force: :cascade do |t|
    t.string   "upload_file_name"
    t.string   "upload_content_type"
    t.integer  "upload_file_size"
    t.datetime "upload_updated_at"
    t.integer  "user_id"
  end

  add_index "uploads", ["user_id"], name: "idx_uploads_on_uid", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                               null: false
    t.string   "crypted_password",                    null: false
    t.string   "password_salt",                       null: false
    t.string   "persistence_token",                   null: false
    t.string   "single_access_token",                 null: false
    t.string   "perishable_token",                    null: false
    t.integer  "login_count",         default: 0,     null: false
    t.integer  "failed_login_count",  default: 0,     null: false
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.string   "role",                                null: false
    t.string   "first_name",                          null: false
    t.string   "last_name",                           null: false
    t.boolean  "banned",              default: false, null: false
    t.string   "phone"
    t.string   "address"
    t.string   "title"
    t.string   "bio"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "udx_users_on_email", unique: true, using: :btree
  add_index "users", ["perishable_token"], name: "udx_users_on_perishable_token", unique: true, using: :btree
  add_index "users", ["persistence_token"], name: "udx_users_on_persistence_token", unique: true, using: :btree
  add_index "users", ["single_access_token"], name: "udx_users_on_single_access_token", unique: true, using: :btree

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

end
