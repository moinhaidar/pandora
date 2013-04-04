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

ActiveRecord::Schema.define(:version => 20130227132047) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
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

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "attendances", :force => true do |t|
    t.integer  "targetable_id"
    t.string   "targetable_type"
    t.date     "att_date"
    t.boolean  "present",         :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attendances", ["att_date"], :name => "index_attendances_on_att_date"
  add_index "attendances", ["present"], :name => "index_attendances_on_present"
  add_index "attendances", ["targetable_id", "targetable_type"], :name => "index_attendances_on_targetable_id_and_targetable_type"

  create_table "classrooms", :force => true do |t|
    t.string   "department"
    t.string   "section"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "holidays", :force => true do |t|
    t.string   "name"
    t.date     "date"
    t.string   "description"
    t.boolean  "weekend"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "schedules", :force => true do |t|
    t.integer  "student_id"
    t.integer  "teacher_id"
    t.integer  "subject_id"
    t.integer  "classroom_id"
    t.string   "duration"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "schedules", ["classroom_id"], :name => "index_schedules_on_classroom_id"
  add_index "schedules", ["duration"], :name => "index_schedules_on_duration"
  add_index "schedules", ["student_id"], :name => "index_schedules_on_student_id"
  add_index "schedules", ["subject_id"], :name => "index_schedules_on_subject_id"
  add_index "schedules", ["teacher_id"], :name => "index_schedules_on_teacher_id"

  create_table "students", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.text     "address"
    t.string   "mobile",     :limit => 11
    t.string   "phone",      :limit => 11
    t.boolean  "active",                   :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "students", ["active"], :name => "index_students_on_active"
  add_index "students", ["email"], :name => "index_students_on_email"
  add_index "students", ["first_name", "last_name"], :name => "index_students_on_first_name_and_last_name"

  create_table "subjects", :force => true do |t|
    t.string   "title"
    t.string   "duration"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subjects", ["title"], :name => "index_subjects_on_title"

  create_table "teachers", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.text     "address"
    t.string   "mobile",     :limit => 11
    t.string   "phone",      :limit => 11
    t.boolean  "active",                   :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "teachers", ["active"], :name => "index_teachers_on_active"
  add_index "teachers", ["email"], :name => "index_teachers_on_email"
  add_index "teachers", ["first_name", "last_name"], :name => "index_teachers_on_first_name_and_last_name"

end
