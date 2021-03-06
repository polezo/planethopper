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

ActiveRecord::Schema.define(version: 10) do

  create_table "landings", force: :cascade do |t|
    t.integer "planet_id"
    t.integer "player_id"
    t.boolean "died"
  end

  create_table "planets", force: :cascade do |t|
    t.string "name"
    t.string "bad_alien"
    t.string "good_alien"
    t.string "creator"
    t.string "champion"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.integer "life"
    t.string "password"
    t.integer "dollars"
  end

  create_table "weapons", force: :cascade do |t|
    t.string "name"
    t.integer "damage_level"
    t.boolean "dangerous?"
    t.string "player_id"
  end

end
