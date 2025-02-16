# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_02_03_034553) do
  create_table "players", force: :cascade do |t|
    t.string "name"
    t.string "player_id"
    t.string "league"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.string "player_name"
    t.float "player_id"
    t.float "pull"
    t.float "center"
    t.float "oppo"
    t.float "fb"
    t.float "gb"
    t.float "ld"
    t.float "hr"
    t.float "iffb"
    t.string "league"
    t.string "reference_player"
    t.float "score"
  end

  create_table "scores", force: :cascade do |t|
    t.string "player_name"
    t.integer "player_id"
    t.float "iso"
    t.float "spd"
    t.float "woba"
    t.float "wrc_plus"
    t.float "obp"
    t.float "score"
    t.string "league"
    t.string "reference_player"
  end
end
