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

ActiveRecord::Schema.define(version: 20170327152000) do

  create_table "activities", force: :cascade do |t|
    t.string   "name"
    t.text     "goals"
    t.string   "ages"
    t.string   "act_kind"
    t.text     "act_description"
    t.text     "openning_game"
    t.text     "methods"
    t.text     "accessories"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "user_id"
    t.index ["user_id"], name: "index_activities_on_user_id"
  end

  create_table "subscribes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "activity_id"
    t.date     "chosen_date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["activity_id"], name: "index_subscribes_on_activity_id"
    t.index ["user_id"], name: "index_subscribes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password"
    t.boolean  "admin"
    t.string   "email"
    t.string   "days_in_week"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "salt"
  end

end
