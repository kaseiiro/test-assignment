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

ActiveRecord::Schema.define(:version => 20120502090448) do

  create_table "job_lists", :force => true do |t|
    t.string   "title"
    t.date     "add"
    t.date     "expire"
    t.integer  "salary"
    t.string   "contacts"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "jskills", :force => true do |t|
    t.string   "description"
    t.integer  "job_list_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "jskills", ["job_list_id"], :name => "index_jskills_on_job_list_id"

  create_table "occupant_skills", :force => true do |t|
    t.string   "description"
    t.integer  "occupant_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "occupant_skills", ["occupant_id"], :name => "index_occupant_skills_on_occupant_id"

  create_table "occupants", :force => true do |t|
    t.string   "namae"
    t.string   "contacts"
    t.integer  "status"
    t.integer  "salary"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "oskills", :force => true do |t|
    t.string   "description"
    t.integer  "occupant_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "oskills", ["occupant_id"], :name => "index_oskills_on_occupant_id"

end
