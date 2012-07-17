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

ActiveRecord::Schema.define(:version => 20120702071708) do

  create_table "acupunctures", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.text     "rendered_content"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "permalink"
  end

  add_index "acupunctures", ["permalink"], :name => "index_acupunctures_on_permalink"

  create_table "admins", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["remember_token"], :name => "index_admins_on_remember_token"

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.text     "content"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.text     "rendered_description"
    t.text     "rendered_content"
  end

  create_table "cuppings", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.text     "rendered_content"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "permalink"
  end

  add_index "cuppings", ["permalink"], :name => "index_cuppings_on_permalink"

  create_table "food_therapies", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.text     "rendered_content"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "permalink"
  end

  add_index "food_therapies", ["permalink"], :name => "index_food_therapies_on_permalink"

  create_table "herbs", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.text     "content"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.text     "rendered_description"
    t.text     "rendered_content"
    t.string   "permalink"
    t.string   "ailment"
  end

  add_index "herbs", ["created_at"], :name => "index_herbs_on_created_at"
  add_index "herbs", ["permalink"], :name => "index_herbs_on_permalink"
  add_index "herbs", ["title"], :name => "index_herbs_on_title"

  create_table "moxibustions", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.text     "rendered_content"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "permalink"
  end

  add_index "moxibustions", ["permalink"], :name => "index_moxibustions_on_permalink"

  create_table "scientific_studies", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.text     "rendered_content"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "permalink"
  end

  add_index "scientific_studies", ["permalink"], :name => "index_scientific_studies_on_permalink"

  create_table "tcms", :force => true do |t|
    t.string   "title"
    t.string   "book"
    t.text     "content"
    t.text     "rendered_content"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "permalink"
  end

  add_index "tcms", ["book"], :name => "index_tcms_on_book"
  add_index "tcms", ["permalink"], :name => "index_tcms_on_permalink"

end
