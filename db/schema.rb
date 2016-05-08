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

ActiveRecord::Schema.define(version: 20160507230144) do

  create_table "inventories", force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "user_id"
    t.integer  "quantity"
    t.boolean  "paypal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "inventories", ["item_id"], name: "index_inventories_on_item_id"
  add_index "inventories", ["user_id"], name: "index_inventories_on_user_id"

  create_table "items", force: :cascade do |t|
    t.string   "id_steam"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "steam_url"
    t.string   "img_url"
  end

  create_table "messages", force: :cascade do |t|
    t.text     "message"
    t.integer  "sender_id",                    null: false
    t.integer  "receiver_id",                  null: false
    t.integer  "sent_item_id"
    t.integer  "rec_item_id"
    t.boolean  "trade"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.boolean  "seen",         default: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "steam_id"
    t.string   "password_digest"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "wishlists", force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "wishlists", ["item_id"], name: "index_wishlists_on_item_id"
  add_index "wishlists", ["user_id"], name: "index_wishlists_on_user_id"

end
