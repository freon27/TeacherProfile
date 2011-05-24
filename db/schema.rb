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

ActiveRecord::Schema.define(:version => 20110508184836) do

  create_table "experience_pages", :force => true do |t|
    t.boolean  "publish_positions"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "profile_id"
    t.boolean  "publish_qualifications"
  end

  create_table "feedbacks", :force => true do |t|
    t.integer  "position_id"
    t.string   "name"
    t.string   "position"
    t.text     "feedback"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "main_pages", :force => true do |t|
    t.integer  "profile_id"
    t.text     "introduction"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "published"
  end

  create_table "philosophy_pages", :force => true do |t|
    t.boolean  "published"
    t.text     "philosophy"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "profile_id"
  end

  create_table "positions", :force => true do |t|
    t.string   "location"
    t.string   "position_type"
    t.date     "date_from"
    t.date     "date_to"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "experience_page_id"
  end

  create_table "profiles", :force => true do |t|
    t.integer  "user_id"
    t.boolean  "published",  :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "url_suffix"
  end

  create_table "qualifications", :force => true do |t|
    t.string   "location"
    t.date     "date_from"
    t.date     "date_to"
    t.integer  "experience_page_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subject_areas", :force => true do |t|
    t.integer  "profile_id"
    t.string   "name"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subjects", :force => true do |t|
    t.string   "name"
    t.integer  "qualification_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "grade"
    t.string   "level"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password"
    t.string   "password_confirmation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "last_name"
    t.string   "first_name"
    t.string   "encrypted_password",    :limit => 128
    t.string   "salt",                  :limit => 128
    t.string   "confirmation_token",    :limit => 128
    t.string   "remember_token",        :limit => 128
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
