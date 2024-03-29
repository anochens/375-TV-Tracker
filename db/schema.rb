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

ActiveRecord::Schema.define(:version => 20110418015029) do

  create_table "actors", :force => true do |t|
    t.string    "last_name"
    t.string    "first_name"
    t.text      "description"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "channels", :force => true do |t|
    t.string    "name"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.string   "name"
    t.text     "body"
    t.integer  "episode_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "episodes", :force => true do |t|
    t.integer   "season_id"
    t.integer   "episode_number"
    t.string    "duration"
    t.date      "air_date"
    t.string    "start_est"
    t.string    "start_cst"
    t.string    "start_pst"
    t.text      "description"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "name"
    t.string    "imdb_id"
    t.string    "picture_url"
    t.integer   "ratings_count",  :default => 0
  end

  create_table "list_items", :force => true do |t|
    t.integer   "user_id"
    t.integer   "series_item_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "ratings", :force => true do |t|
    t.integer   "episode_id"
    t.integer   "stars"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.integer   "user_id"
  end

  create_table "roles", :force => true do |t|
    t.integer   "series_item_id"
    t.integer   "actor_id"
    t.text      "description"
    t.string    "character_name"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "seasons", :force => true do |t|
    t.integer   "series_item_id"
    t.integer   "season_number"
    t.date      "start_date"
    t.date      "end_date"
    t.text      "description"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "series_items", :force => true do |t|
    t.integer   "channel_id"
    t.string    "name"
    t.text      "description"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.integer   "remote_id"
    t.string    "image"
  end

  create_table "users", :force => true do |t|
    t.string    "username"
    t.string    "email"
    t.string    "password_hash"
    t.string    "password_salt"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "watched_episodes", :force => true do |t|
    t.integer   "user_id"
    t.integer   "episode_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

end
