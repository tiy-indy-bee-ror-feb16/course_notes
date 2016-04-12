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

ActiveRecord::Schema.define(version: 20160406152933) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: :cascade do |t|
    t.string   "name"
    t.text     "bio"
    t.boolean  "active"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "posts_count"
    t.integer  "word_count",      default: 0
    t.string   "password_digest"
  end

  create_table "authorships", force: :cascade do |t|
    t.integer  "author_id"
    t.integer  "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "authorships", ["author_id"], name: "index_authorships_on_author_id", using: :btree
  add_index "authorships", ["post_id"], name: "index_authorships_on_post_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "commentable_id"
    t.integer  "author_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "commentable_type", default: "Post"
  end

  add_index "comments", ["author_id"], name: "index_comments_on_author_id", using: :btree
  add_index "comments", ["commentable_id"], name: "index_comments_on_commentable_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.string   "image"
    t.integer  "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "posts", ["author_id"], name: "index_posts_on_author_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tagships", force: :cascade do |t|
    t.integer  "post_id"
    t.integer  "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tagships", ["post_id"], name: "index_tagships_on_post_id", using: :btree
  add_index "tagships", ["tag_id"], name: "index_tagships_on_tag_id", using: :btree

  add_foreign_key "authorships", "authors"
  add_foreign_key "authorships", "posts"
  add_foreign_key "comments", "authors"
  add_foreign_key "comments", "posts", column: "commentable_id"
  add_foreign_key "posts", "authors"
  add_foreign_key "tagships", "posts"
  add_foreign_key "tagships", "tags"
end
