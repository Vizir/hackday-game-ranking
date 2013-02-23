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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130223183847) do

  create_table "games", :force => true do |t|
    t.integer  "player1_id"
    t.integer  "player1_score"
    t.integer  "player1_team_id"
    t.integer  "player2_id"
    t.integer  "player2_score"
    t.integer  "player2_team_id"
    t.boolean  "exhibition"
    t.integer  "league_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "games", ["league_id"], :name => "index_games_on_league_id"

  create_table "leagues", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "players", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "username"
    t.string   "name"
    t.string   "pictureUrl"
  end

  add_index "players", ["email"], :name => "index_players_on_email", :unique => true
  add_index "players", ["reset_password_token"], :name => "index_players_on_reset_password_token", :unique => true

  create_table "rankings", :force => true do |t|
    t.integer  "league_id"
    t.integer  "player_id"
    t.integer  "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "rankings", ["league_id"], :name => "index_rankings_on_league_id"
  add_index "rankings", ["player_id"], :name => "index_rankings_on_player_id"
  add_index "rankings", ["position"], :name => "index_rankings_on_position"

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.string   "logo"
    t.integer  "attack"
    t.integer  "middle"
    t.integer  "defense"
    t.float    "score"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "timelines", :force => true do |t|
    t.string   "message"
    t.integer  "league_id"
    t.integer  "game_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
