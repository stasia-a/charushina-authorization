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

ActiveRecord::Schema.define(:version => 20121006222305) do

  create_table "sessions", :force => true do |t|
    t.integer  "user_id"
    t.string   "client_id",                                 :null => false
    t.string   "ip_address",                                :null => false
    t.string   "user_agent"
    t.integer  "login_count",                :default => 0, :null => false
    t.string   "unique_key"
    t.datetime "unique_key_generated_at"
    t.integer  "confirmation_failure_count", :default => 0, :null => false
    t.datetime "client_confirmed_at"
    t.datetime "authenticated_at"
    t.datetime "finished_at"
    t.string   "login"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  add_index "sessions", ["user_id", "client_id"], :name => "index_sessions_on_user_id_and_client_id", :unique => true

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "auth_secret"
    t.string   "full_name"
    t.boolean  "admin",           :default => false
    t.string   "github_uid"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
