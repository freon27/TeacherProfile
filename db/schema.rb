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

ActiveRecord::Schema.define(:version => 20120113122032) do

  create_table "documents", :force => true do |t|
    t.string   "caption"
    t.text     "description"
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "project_id"
  end

  add_index "documents", ["project_id"], :name => "index_documents_on_project_id"
  add_index "documents", ["user_id"], :name => "index_documents_on_user_id"

  create_table "experience_pages", :force => true do |t|
    t.boolean  "publish_positions"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "publish_qualifications"
    t.integer  "user_id"
  end

  add_index "experience_pages", ["user_id"], :name => "index_experience_pages_on_user_id"

  create_table "feedbacks", :force => true do |t|
    t.integer  "position_id"
    t.string   "name"
    t.string   "position"
    t.text     "feedback"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "main_pages", :force => true do |t|
    t.text     "introduction"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "published"
    t.integer  "user_id"
  end

  add_index "main_pages", ["user_id"], :name => "index_main_pages_on_user_id"

  create_table "philosophy_pages", :force => true do |t|
    t.boolean  "published"
    t.text     "philosophy"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "philosophy_pages", ["user_id"], :name => "index_philosophy_pages_on_user_id"

  create_table "photos", :force => true do |t|
    t.string   "caption"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "project_id"
  end

  add_index "photos", ["project_id"], :name => "index_photos_on_project_id"
  add_index "photos", ["user_id"], :name => "index_photos_on_user_id"

  create_table "positions", :force => true do |t|
    t.string   "location"
    t.string   "position_type"
    t.date     "date_from"
    t.date     "date_to"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "experience_page_id"
    t.integer  "user_id"
  end

  add_index "positions", ["experience_page_id"], :name => "index_positions_on_experience_page_id"
  add_index "positions", ["user_id"], :name => "index_positions_on_user_id"

  create_table "profiles", :force => true do |t|
    t.integer  "user_id"
    t.boolean  "published",           :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "url_suffix"
    t.string   "main_subject"
    t.integer  "main_page_id"
    t.integer  "philosophy_page_id"
    t.integer  "experience_page_id"
    t.integer  "sample_work_page_id"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.date     "photo_file_size"
    t.integer  "photo_updated_at"
  end

  add_index "profiles", ["experience_page_id"], :name => "index_profiles_on_experience_page_id"
  add_index "profiles", ["main_page_id"], :name => "index_profiles_on_main_page_id"
  add_index "profiles", ["philosophy_page_id"], :name => "index_profiles_on_philosophy_page_id"
  add_index "profiles", ["sample_work_page_id"], :name => "index_profiles_on_sample_work_page_id"
  add_index "profiles", ["url_suffix"], :name => "index_profiles_on_url_suffix"
  add_index "profiles", ["user_id"], :name => "index_profiles_on_user_id"

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "subject_area_id"
    t.integer  "user_id"
  end

  add_index "projects", ["subject_area_id"], :name => "index_projects_on_subject_area_id"
  add_index "projects", ["user_id"], :name => "index_projects_on_user_id"

  create_table "qualifications", :force => true do |t|
    t.string   "location"
    t.date     "date_from"
    t.date     "date_to"
    t.integer  "experience_page_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "qualifications", ["experience_page_id"], :name => "index_qualifications_on_experience_page_id"
  add_index "qualifications", ["user_id"], :name => "index_qualifications_on_user_id"

  create_table "sample_work_pages", :force => true do |t|
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "sample_work_pages", ["user_id"], :name => "index_sample_work_pages_on_user_id"

  create_table "subject_areas", :force => true do |t|
    t.integer  "sample_work_page_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "subject_areas", ["sample_work_page_id"], :name => "index_subject_areas_on_sample_work_page_id"
  add_index "subject_areas", ["user_id"], :name => "index_subject_areas_on_user_id"

  create_table "subjects", :force => true do |t|
    t.string   "name"
    t.integer  "qualification_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "grade"
    t.string   "level"
    t.integer  "user_id"
  end

  add_index "subjects", ["qualification_id"], :name => "index_subjects_on_qualification_id"
  add_index "subjects", ["user_id"], :name => "index_subjects_on_user_id"

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
    t.datetime "subscribed_until",                     :default => '2012-01-13 12:35:56', :null => false
    t.boolean  "admin",                                :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
