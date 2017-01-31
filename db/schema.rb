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

ActiveRecord::Schema.define(version: 20170131212809) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "inventories", force: :cascade do |t|
    t.integer  "product_id", null: false
    t.string   "style",      null: false
    t.integer  "count",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "waist",      null: false
    t.integer  "length",     null: false
  end

  add_index "inventories", ["product_id"], name: "index_inventories_on_product_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "product_name",  null: false
    t.string   "product_image", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.integer  "product_id"
  end

end
