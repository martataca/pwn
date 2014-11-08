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

ActiveRecord::Schema.define(version: 20141010205931) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
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

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "profiles", force: true do |t|
    t.integer  "user_id"
    t.float    "percentage"
    t.string   "firstName"
    t.string   "surnames"
    t.integer  "age"
    t.string   "email"
    t.string   "phone_number",                                  default: "",                  null: false
    t.string   "skype_name",                                    default: ""
    t.string   "linkedin_profile",                              default: ""
    t.string   "picture"
    t.string   "cv"
    t.integer  "born_on_day"
    t.integer  "born_on_month"
    t.integer  "born_on_year"
    t.string   "sex"
    t.string   "country_origin"
    t.string   "country_residence"
    t.text     "city"
    t.text     "marital_status"
    t.integer  "number_children"
    t.string   "highest_academic",                              default: "Please select one"
    t.text     "highest_academic_other"
    t.string   "main_area",                                     default: "Please select one"
    t.text     "main_area_other"
    t.text     "study_country"
    t.text     "studies_other"
    t.integer  "years_experience"
    t.integer  "years_in_company"
    t.integer  "number_subordinates"
    t.text     "reporting_level"
    t.text     "international_experience"
    t.string   "company",                                       default: "Please select one"
    t.text     "company_other"
    t.text     "company_title"
    t.text     "job_level"
    t.string   "company_job_function",                          default: "Please select one"
    t.string   "company_sector",                                default: "Please select one"
    t.string   "company_nation",                                default: "Please select one"
    t.text     "member"
    t.integer  "member_years"
    t.text     "previous_participation"
    t.text     "previous_participation_other"
    t.text     "availability_8"
    t.text     "availability_12"
    t.text     "availability_18"
    t.text     "availability_no"
    t.text     "availability_networking_no"
    t.text     "availability_monthly_breakfasts"
    t.text     "availability_buddy_contacts"
    t.text     "availability_obs"
    t.text     "permission_benchmarking"
    t.text     "permission_promoting"
    t.text     "permission_other"
    t.text     "career_description"
    t.text     "strengh_1"
    t.text     "strengh_2"
    t.text     "strengh_3"
    t.text     "interests_and_characteristics"
    t.text     "self_description"
    t.text     "motivations"
    t.text     "goal_1"
    t.text     "goal_2"
    t.text     "goal_3"
    t.text     "aspirations"
    t.text     "want_to_be_known_for"
    t.text     "mentoring_in"
    t.text     "mentoring_in_other_one"
    t.text     "mentoring_in_leadership"
    t.text     "mentoring_in_change"
    t.text     "mentoring_in_conflict"
    t.text     "mentoring_in_people"
    t.text     "mentoring_in_political"
    t.text     "mentoring_in_strategic"
    t.text     "mentoring_in_cross_cultural"
    t.text     "mentoring_in_networking"
    t.text     "mentoring_in_other_two"
    t.string   "ideal_mentor_function_1"
    t.string   "ideal_mentor_sector_1"
    t.string   "ideal_mentor_function_2"
    t.string   "ideal_mentor_sector_2"
    t.string   "ideal_mentor_function_3"
    t.string   "ideal_mentor_sector_3"
    t.text     "ideal_mentor_func_sec_other"
    t.string   "ideal_mentor_strength_1"
    t.string   "ideal_mentor_strength_2"
    t.string   "ideal_mentor_strength_3"
    t.text     "ideal_mentor_interests"
    t.text     "ideal_mentor_role"
    t.string   "mentor_gender_preference"
    t.string   "mentor_referral_1"
    t.string   "mentor_referral_2"
    t.string   "mentor_referral_3"
    t.string   "company_is_aware"
    t.string   "company_is_not_aware"
    t.string   "company_is_sponsor"
    t.string   "company_suggested"
    t.string   "company_supports"
    t.string   "institutional_support_other"
    t.text     "heard_about_program_from_epwn"
    t.text     "heard_about_program_from_previous_participant"
    t.text     "heard_about_program_from_epwn_member"
    t.text     "heard_about_program_from_company"
    t.text     "heard_about_program_in_the_press"
    t.text     "heard_about_program_from_other_specified"
    t.text     "mentee_fee_aware"
    t.text     "act_as_sounding_board"
    t.text     "provide_developmental_feedback"
    t.text     "share_experiences"
    t.text     "connect_with_relevant_people"
    t.text     "mentor_preferred_role"
    t.text     "sugestion_1"
    t.text     "sugestion_2"
    t.text     "sugestion_3"
    t.text     "sugestion_4"
    t.text     "sugestion_5"
    t.text     "sugestion_6"
    t.boolean  "submitted",                                     default: false,               null: false
    t.boolean  "select1",                                       default: false,               null: false
    t.boolean  "select2",                                       default: false,               null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "type",                   default: "", null: false
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
