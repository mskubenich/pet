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

ActiveRecord::Schema.define(version: 20150606180938) do

  create_table "attachments", force: :cascade do |t|
    t.integer  "entity_id",         limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "file_file_name",    limit: 255
    t.string   "file_content_type", limit: 255
    t.integer  "file_file_size",    limit: 4
    t.datetime "file_updated_at"
    t.string   "entity_type",       limit: 255
  end

  create_table "copulations", force: :cascade do |t|
    t.string   "family",      limit: 255
    t.string   "name",        limit: 255
    t.integer  "age",         limit: 4
    t.string   "breed",       limit: 255
    t.boolean  "scorp",       limit: 1
    t.boolean  "rkf",         limit: 1
    t.text     "description", limit: 65535
    t.integer  "price",       limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "news", force: :cascade do |t|
    t.boolean  "rkf",                        limit: 1
    t.boolean  "scorp",                      limit: 1
    t.integer  "user_id",                    limit: 4
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "preview_image_file_name",    limit: 255
    t.string   "preview_image_content_type", limit: 255
    t.integer  "preview_image_file_size",    limit: 4
    t.datetime "preview_image_updated_at"
    t.text     "body_ru",                    limit: 65535
    t.text     "body_en",                    limit: 65535
    t.string   "title_ru",                   limit: 255
    t.string   "title_en",                   limit: 255
  end

  create_table "roles", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "roles_users", force: :cascade do |t|
    t.integer "user_id", limit: 4
    t.integer "role_id", limit: 4
  end

  create_table "sessions", force: :cascade do |t|
    t.string   "token",      limit: 255
    t.integer  "user_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "static_pages", force: :cascade do |t|
    t.text   "body_ru", limit: 65535
    t.text   "body_en", limit: 65535
    t.string "name",    limit: 255
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",          limit: 255
    t.string   "last_name",           limit: 255
    t.string   "email",               limit: 255
    t.string   "login",               limit: 255
    t.string   "phone",               limit: 255
    t.string   "salt",                limit: 255
    t.string   "encrypted_password",  limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.boolean  "rkf",                 limit: 1,   default: false
    t.boolean  "scorp",               limit: 1,   default: false
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size",    limit: 4
    t.datetime "avatar_updated_at"
  end

end
