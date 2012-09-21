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

ActiveRecord::Schema.define(:version => 20120920155856) do

  create_table "boites", :force => true do |t|
    t.integer  "numero"
    t.integer  "tiroir_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "clients", :force => true do |t|
    t.string   "nom"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "clones", :force => true do |t|
    t.string   "typeI"
    t.string   "typeII"
    t.integer  "client_id"
    t.string   "nom"
    t.string   "reference"
    t.string   "origine"
    t.string   "localisation"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.datetime "date_banking"
    t.string   "milieu_congelation"
    t.string   "tests"
  end

  create_table "positionings", :force => true do |t|
    t.integer  "clone_id"
    t.integer  "user_id"
    t.integer  "position_id_ref"
    t.integer  "position_id_travail"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "positions", :force => true do |t|
    t.integer  "boite_id"
    t.integer  "numero"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tiroirs", :force => true do |t|
    t.string   "site"
    t.integer  "numero"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
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
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
