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
    t.string   "firstName"
    t.string   "surnames"
    t.integer  "percentage"
    t.string   "fullName"
    t.integer  "age"
    t.string   "email"
    t.string   "phone_number",                                        default: "", null: false
    t.string   "skype_name",                                          default: ""
    t.string   "linkedin_profile",                                    default: ""
    t.string   "picture"
    t.string   "cv"
    t.date     "born_on"
    t.string   "sex"
    t.string   "country_origin"
    t.string   "country_residence"
    t.text     "city"
    t.text     "marital_status"
    t.integer  "number_children"
    t.text     "highest_academic"
    t.text     "main_area"
    t.text     "study_country"
    t.text     "studies_other"
    t.integer  "years_experience"
    t.integer  "years_in_company"
    t.integer  "number_subordinates"
    t.text     "reporting_level"
    t.text     "international_experience"
    t.text     "company"
    t.text     "company_title"
    t.text     "job_level"
    t.text     "company_area"
    t.text     "company_sector"
    t.text     "company_nation"
    t.text     "member"
    t.text     "participation_company_program_as_mentor"
    t.text     "participation_company_program_as_mentee"
    t.text     "participation_lisbon_epwn_as_mentor"
    t.text     "participation_lisbon_epwn_as_mentee"
    t.text     "participation_europe_epwn_as_mentor"
    t.text     "participation_europe_epwn_as_mentee"
    t.text     "participation_other_as_mentor"
    t.text     "participation_other_as_mentee"
    t.text     "participation_other_specified"
    t.text     "availability_8"
    t.text     "availability_12"
    t.text     "availability_18"
    t.text     "availability_monthly_breakfasts"
    t.text     "availability_buddy_contacts"
    t.text     "career_description"
    t.text     "strengh_1"
    t.text     "strengh_2"
    t.text     "strengh_3"
    t.text     "strengh_4"
    t.text     "strengh_5"
    t.text     "strengh_6"
    t.text     "interests"
    t.text     "self_description"
    t.text     "motivations"
    t.text     "expectations"
    t.text     "aspirations"
    t.text     "want_to_be_known_for"
    t.text     "seeks_mentoring_in_career_orientation"
    t.text     "seeks_mentoring_in_career_transition"
    t.text     "seeks_mentoring_in_change_management"
    t.text     "seeks_mentoring_in_conflict_management"
    t.text     "seeks_mentoring_in_corporate_communication"
    t.text     "seeks_mentoring_in_cross_cultural_communication"
    t.text     "seeks_mentoring_in_cross_cultural_working_practices"
    t.text     "seeks_mentoring_in_entreperneurship"
    t.text     "seeks_mentoring_in_goal_setting_and_advancement"
    t.text     "seeks_mentoring_in_leadership_development"
    t.text     "seeks_mentoring_in_optimal_use_of_a_network"
    t.text     "seeks_mentoring_in_people_management"
    t.text     "seeks_mentoring_in_political_acumen"
    t.text     "seeks_mentoring_in_reintegration_and_work_immersion"
    t.text     "seeks_mentoring_in_strategic_thinking"
    t.text     "seeks_mentoring_in_time_management"
    t.text     "seeks_mentoring_in_work_life_balance"
    t.text     "seeks_mentoring_in_other_specified"
    t.text     "goal_1"
    t.text     "goal_2"
    t.text     "goal_3"
    t.string   "ideal_mentor_function"
    t.string   "ideal_mentor_sector"
    t.string   "ideal_mentor_strength_1"
    t.string   "ideal_mentor_strength_2"
    t.string   "ideal_mentor_strength_3"
    t.string   "ideal_mentor_strength_4"
    t.string   "ideal_mentor_strength_5"
    t.string   "ideal_mentor_strength_6"
    t.text     "ideal_mentor_interests"
    t.text     "ideal_mentor_role"
    t.string   "mentor_gender_preference"
    t.string   "mental_referral_1"
    t.string   "mental_referral_2"
    t.string   "mental_referral_3"
    t.string   "company_is_aware_of_program"
    t.string   "company_suggested_participation"
    t.string   "company_supports_participation"
    t.text     "heard_about_program_from_epwn"
    t.text     "heard_about_program_from_previous_participant"
    t.text     "heard_about_program_from_epwn_member"
    t.text     "heard_about_program_from_company"
    t.text     "heard_about_program_in_the_press"
    t.text     "heard_about_program_from_other_specified"
    t.text     "preference_or_constraint"
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
