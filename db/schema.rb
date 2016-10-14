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

ActiveRecord::Schema.define(version: 20161014041422) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string   "name",               null: false
    t.string   "slug"
    t.string   "state",              null: false
    t.string   "url"
    t.text     "description",        null: false
    t.datetime "begin_date",         null: false
    t.datetime "end_date",           null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "user_id",            null: false
    t.integer  "org_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.boolean  "all_day"
    t.text     "summary"
    t.string   "location"
  end

  create_table "listings", force: :cascade do |t|
    t.integer  "org_id"
    t.integer  "user_id"
    t.string   "org_name"
    t.string   "title"
    t.string   "state",                              null: false
    t.string   "email"
    t.string   "phone"
    t.string   "url"
    t.text     "description"
    t.text     "responsibilities"
    t.text     "qualifications"
    t.text     "instructions"
    t.datetime "date_posted",                        null: false
    t.boolean  "full_time",           default: true
    t.string   "upload_file_name"
    t.string   "upload_content_type"
    t.integer  "upload_file_size"
    t.datetime "upload_updated_at"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id",        null: false
    t.integer  "payment_method", null: false
    t.string   "state",          null: false
    t.text     "order_notes"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "orgs", force: :cascade do |t|
    t.string   "name",                     null: false
    t.string   "abbreviation"
    t.string   "slug"
    t.string   "role",                     null: false
    t.boolean  "active",                   null: false
    t.string   "phone"
    t.string   "address"
    t.string   "city"
    t.string   "contact"
    t.string   "email"
    t.string   "website"
    t.string   "org_type"
    t.text     "description"
    t.text     "inspiration"
    t.text     "pride"
    t.text     "involvement"
    t.text     "funding"
    t.text     "alliance"
    t.text     "interviewee"
    t.string   "interviewee_title"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "staff_photo_file_name"
    t.string   "staff_photo_content_type"
    t.integer  "staff_photo_file_size"
    t.datetime "staff_photo_updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "photo_two_file_name"
    t.string   "photo_two_content_type"
    t.integer  "photo_two_file_size"
    t.datetime "photo_two_updated_at"
    t.string   "photo_three_file_name"
    t.string   "photo_three_content_type"
    t.integer  "photo_three_file_size"
    t.datetime "photo_three_updated_at"
    t.string   "photo_four_file_name"
    t.string   "photo_four_content_type"
    t.integer  "photo_four_file_size"
    t.datetime "photo_four_updated_at"
    t.boolean  "spotlight"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "pages", force: :cascade do |t|
    t.string   "title",                      null: false
    t.string   "body"
    t.string   "slug"
    t.boolean  "menu"
    t.boolean  "published"
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

  create_table "posts", force: :cascade do |t|
    t.string   "title",                      null: false
    t.text     "abstract"
    t.text     "body"
    t.string   "slug"
    t.integer  "user_id",                    null: false
    t.boolean  "published",  default: false, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "registrations", force: :cascade do |t|
    t.integer  "training_id", null: false
    t.integer  "attendees",   null: false
    t.integer  "order_id",    null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "settings", force: :cascade do |t|
    t.string   "phone",               default: "901.111.1111", null: false
    t.string   "address",             default: "123 S. Main",  null: false
    t.string   "footer",              default: "The footer",   null: false
    t.string   "title",               default: "Website",      null: false
    t.string   "facebook"
    t.string   "twitter"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "banner_file_name"
    t.string   "banner_content_type"
    t.integer  "banner_file_size"
    t.datetime "banner_updated_at"
    t.string   "email"
    t.string   "mailing_list"
  end

  create_table "training_categories", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "trainings", force: :cascade do |t|
    t.string   "name",                                 null: false
    t.string   "location",                             null: false
    t.string   "slug"
    t.text     "description",                          null: false
    t.text     "facilitators",                         null: false
    t.datetime "begin_date",                           null: false
    t.datetime "end_date",                             null: false
    t.integer  "max_registrations",                    null: false
    t.boolean  "featured",                             null: false
    t.decimal  "fee",                                  null: false
    t.integer  "training_category_id",                 null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.boolean  "all_day",              default: false
    t.boolean  "multi_day",            default: false
    t.jsonb    "days",                 default: {},    null: false
    t.string   "paypal_url"
    t.string   "paypal_url_member"
    t.text     "summary"
    t.string   "state"
    t.decimal  "fee_member"
    t.text     "fit"
  end

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
    t.boolean  "validated",           default: false, null: false
    t.string   "phone"
    t.string   "address"
    t.string   "title"
    t.string   "bio"
    t.integer  "org_id"
    t.string   "submitted_org"
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
