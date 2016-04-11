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

ActiveRecord::Schema.define(version: 20160410132504) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blockers", force: :cascade do |t|
    t.integer  "blocker_id"
    t.integer  "blocked_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "blockers", ["blocked_id"], name: "index_blockers_on_blocked_id", using: :btree
  add_index "blockers", ["blocker_id"], name: "index_blockers_on_blocker_id", using: :btree

  create_table "carrotings", force: :cascade do |t|
    t.integer  "carrot_id"
    t.integer  "cheep_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "carrotings", ["carrot_id"], name: "index_carrotings_on_carrot_id", using: :btree
  add_index "carrotings", ["cheep_id"], name: "index_carrotings_on_cheep_id", using: :btree

  create_table "carrots", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cheeps", force: :cascade do |t|
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "cheeps", ["user_id"], name: "index_cheeps_on_user_id", using: :btree

  create_table "follows", force: :cascade do |t|
    t.integer  "followed_id"
    t.integer  "follower_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "follows", ["followed_id"], name: "index_follows_on_followed_id", using: :btree
  add_index "follows", ["follower_id"], name: "index_follows_on_follower_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.text     "bio"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "image_url"
  end

  add_foreign_key "carrotings", "carrots"
  add_foreign_key "carrotings", "cheeps"
  add_foreign_key "cheeps", "users"
end
