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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140930000059) do

  create_table "profiles", force: true do |t|
    t.integer  "user_id"
    t.string   "phone_number",             default: "", null: false
    t.string   "skype_name",               default: ""
    t.string   "linkedin_profile",         default: ""
    t.integer  "age"
    t.string   "sex"
    t.string   "nationality"
    t.string   "city"
    t.string   "marital_status"
    t.integer  "number_children"
    t.string   "main_area"
    t.string   "highest_academic"
    t.string   "study_country"
    t.integer  "years_experience"
    t.integer  "number_subordinates"
    t.string   "reporting_level"
    t.string   "international_experience"
    t.string   "company"
    t.string   "company_title"
    t.string   "company_area"
    t.string   "company_sector"
    t.string   "company_nation"
    t.boolean  "member"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "firstName",              default: "", null: false
    t.string   "lastName",               default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["firstName"], name: "index_users_on_firstName", using: :btree
  add_index "users", ["lastName"], name: "index_users_on_lastName", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
