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

ActiveRecord::Schema.define(version: 20140525235300) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "photos", force: true do |t|
    t.string  "name"
    t.integer "review_id"
  end

  add_index "photos", ["review_id"], name: "index_photos_on_review_id", using: :btree

  create_table "reviews", force: true do |t|
    t.string   "make",          null: false
    t.string   "model",         null: false
    t.text     "camera_review", null: false
    t.text     "conclusion",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
