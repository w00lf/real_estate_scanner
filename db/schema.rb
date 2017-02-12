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

ActiveRecord::Schema.define(version: 20170212164332) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "flats", force: :cascade do |t|
    t.integer  "house_floors"
    t.integer  "floor"
    t.integer  "square"
    t.string   "address"
    t.string   "source_inner_id"
    t.integer  "metro_station_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "added_at"
  end

  create_table "metro_lines", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "metro_stations", force: :cascade do |t|
    t.integer  "flats_count"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "metro_line_id"
  end

  add_index "metro_stations", ["metro_line_id"], name: "index_metro_stations_on_metro_line_id", using: :btree

  create_table "offer_types", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "offers", force: :cascade do |t|
    t.integer  "price",         null: false
    t.integer  "source_id"
    t.integer  "flat_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "offer_type_id"
  end

  add_index "offers", ["offer_type_id"], name: "index_offers_on_offer_type_id", using: :btree

  create_table "sources", force: :cascade do |t|
    t.string   "title"
    t.string   "url"
    t.string   "parser"
    t.boolean  "active",     default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
