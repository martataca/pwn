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
    t.string   "fullName"
    t.string   "email"
    t.string   "phone_number",                                        default: "", null: false
    t.string   "skype_name",                                          default: ""
    t.string   "linkedin_profile",                                    default: ""
    t.string   "picture"
    t.string   "cv"
    t.integer  "age"
    t.string   "nationality"
    t.string   "city"
    t.string   "marital_status"
    t.integer  "number_children"
    t.string   "highest_academic"
    t.string   "main_area"
    t.string   "study_country"
    t.string   "studies_other"
    t.integer  "years_experience"
    t.integer  "number_subordinates"
    t.string   "reporting_level"
    t.string   "international_experience"
    t.string   "company"
    t.string   "company_title"
    t.string   "job_level"
    t.string   "company_area"
    t.string   "company_sector"
    t.string   "company_nation"
    t.string   "member"
    t.string   "participation_company_program_as_mentor"
    t.string   "participation_company_program_as_mentee"
    t.string   "participation_lisbon_epwn_as_mentor"
    t.string   "participation_lisbon_epwn_as_mentee"
    t.string   "participation_europe_epwn_as_mentor"
    t.string   "participation_europe_epwn_as_mentee"
    t.string   "participation_other_as_mentor"
    t.string   "participation_other_as_mentee"
    t.string   "participation_other_specified"
    t.string   "availability_8"
    t.string   "availability_12"
    t.string   "availability_18"
    t.string   "availability_monthly_breakfasts"
    t.string   "availability_buddy_contacts"
    t.text     "career_description"
    t.string   "strengh_1"
    t.string   "strengh_2"
    t.string   "strengh_3"
    t.string   "strengh_4"
    t.string   "strengh_5"
    t.string   "strengh_6"
    t.text     "interests"
    t.text     "self_description"
    t.text     "motivations"
    t.text     "expectations"
    t.text     "aspirations"
    t.text     "want_to_be_known_for"
    t.string   "seeks_mentoring_in_career_orientation"
    t.string   "seeks_mentoring_in_career_transition"
    t.string   "seeks_mentoring_in_change_management"
    t.string   "seeks_mentoring_in_conflict_management"
    t.string   "seeks_mentoring_in_corporate_communication"
    t.string   "seeks_mentoring_in_cross_cultural_communication"
    t.string   "seeks_mentoring_in_cross_cultural_working_practices"
    t.string   "seeks_mentoring_in_entreperneurship"
    t.string   "seeks_mentoring_in_goal_setting_and_advancement"
    t.string   "seeks_mentoring_in_leadership_development"
    t.string   "seeks_mentoring_in_optimal_use_of_a_network"
    t.string   "seeks_mentoring_in_people_management"
    t.string   "seeks_mentoring_in_political_acumen"
    t.string   "seeks_mentoring_in_reintegration_and_work_immersion"
    t.string   "seeks_mentoring_in_strategic_thinking"
    t.string   "seeks_mentoring_in_time_management"
    t.string   "seeks_mentoring_in_work_life_balance"
    t.string   "seeks_mentoring_in_other_specified"
    t.string   "goal_1"
    t.string   "goal_2"
    t.string   "goal_3"
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
    t.string   "heard_about_program_from_epwn"
    t.string   "heard_about_program_from_previous_participant"
    t.string   "heard_about_program_from_epwn_member"
    t.string   "heard_about_program_from_company"
    t.string   "heard_about_program_in_the_press"
    t.string   "heard_about_program_from_other_specified"
    t.text     "preference_or_constraint"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "type",                                null: false
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
