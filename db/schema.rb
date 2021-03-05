# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_13_134553) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "action_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "actions", force: :cascade do |t|
    t.bigint "deal_id"
    t.bigint "participant_id"
    t.bigint "card_id"
    t.bigint "action_type_id"
    t.string "order"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["action_type_id"], name: "index_actions_on_action_type_id"
    t.index ["card_id"], name: "index_actions_on_card_id"
    t.index ["deal_id"], name: "index_actions_on_deal_id"
    t.index ["participant_id"], name: "index_actions_on_participant_id"
  end

  create_table "cards", force: :cascade do |t|
    t.string "card_name"
    t.bigint "suit_id"
    t.bigint "rank_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["rank_id"], name: "index_cards_on_rank_id"
    t.index ["suit_id"], name: "index_cards_on_suit_id"
  end

  create_table "deal_orders", force: :cascade do |t|
    t.bigint "participant_id"
    t.bigint "deal_id"
    t.integer "player_order"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["deal_id"], name: "index_deal_orders_on_deal_id"
    t.index ["participant_id"], name: "index_deal_orders_on_participant_id"
  end

  create_table "deals", force: :cascade do |t|
    t.bigint "match_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string "result"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["match_id"], name: "index_deals_on_match_id"
  end

  create_table "matches", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "participants", force: :cascade do |t|
    t.bigint "user_id"
    t.uuid "match_id"
    t.integer "initial_player_order"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["match_id"], name: "index_participants_on_match_id"
    t.index ["user_id"], name: "index_participants_on_user_id"
  end

  create_table "ranks", force: :cascade do |t|
    t.string "rank_name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "suits", force: :cascade do |t|
    t.string "suit_name", null: false
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
