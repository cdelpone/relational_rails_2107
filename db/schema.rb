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

ActiveRecord::Schema.define(version: 2021_08_26_175530) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: :cascade do |t|
    t.string "brand_name"
    t.decimal "established"
    t.boolean "gnarly"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "distilleries", force: :cascade do |t|
    t.string "name"
    t.boolean "scotland_location"
    t.integer "established"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scotches", force: :cascade do |t|
    t.string "name"
    t.boolean "single_malt"
    t.integer "year"
    t.bigint "distillery_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["distillery_id"], name: "index_scotches_on_distillery_id"
  end

  create_table "skateboards", force: :cascade do |t|
    t.string "board_name"
    t.float "cost"
    t.boolean "nose"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "brand_id"
    t.index ["brand_id"], name: "index_skateboards_on_brand_id"
  end

  add_foreign_key "scotches", "distilleries"
  add_foreign_key "skateboards", "brands"
end
