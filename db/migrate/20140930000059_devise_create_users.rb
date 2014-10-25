class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      ## Database authenticatable
      t.string :type,               null: false, default: ""                 
      t.string :firstName,          null: false, default: ""
      t.string :lastName,           null: false, default: ""
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps
    end
    
    create_table :profiles do |t|
      t.belongs_to :user, index: true, unique: true 

      ##Vars for Selection
      t.decimal   :percentage
      

      
      ## About Myself - Contact Details
      t.string	:fullName
      t.integer   :age
      t.string	:email
      t.string	:phone_number, 		null: false, default: ""
      t.string	:skype_name, 		default: ""
      t.string	:linkedin_profile, 	default: ""
      t.string	:picture
      t.string	:cv

      ## About Myself - Demographics
      t.date     :born_on
      t.string   :sex
      t.string   :country_origin
      t.string   :country_residence
      t.text     :city
      t.text     :marital_status
      t.integer  :number_children

      
      ##About Myself - Studies
      t.text	:highest_academic
      t.text	:main_area
      t.text	:study_country
      t.text	:studies_other
      
      ##About Myself - Professional Experience
      t.integer	:years_experience
      t.integer	:number_subordinates
      t.text	:reporting_level
      t.text	:international_experience
      t.text	:company
      t.text	:company_title
      
      t.text  :job_level
      
      ##About the Company 
      t.text  :company_area
      t.text  :company_sector
      t.text  :company_nation
      
      ##EPWN 
      t.text  :member

      ##Other Programs
      t.text  :participation_company_program_as_mentor
      t.text  :participation_company_program_as_mentee
      t.text  :participation_lisbon_epwn_as_mentor
      t.text  :participation_lisbon_epwn_as_mentee
      t.text  :participation_europe_epwn_as_mentor
      t.text  :participation_europe_epwn_as_mentee
      t.text  :participation_other_as_mentor
      t.text  :participation_other_as_mentee
      t.text  :participation_other_specified

      ##Availability
      t.text :availability_8
      t.text :availability_12
      t.text :availability_18
      t.text :availability_monthly_breakfasts
      t.text :availability_buddy_contacts
      
      ##Description of Myself
      t.text    :career_description
      t.text    :strengh_1
      t.text    :strengh_2
      t.text    :strengh_3
      t.text    :strengh_4
      t.text    :strengh_5
      t.text    :strengh_6
      t.text    :interests
      t.text    :self_description
      
      #Mentoring Interest
      t.text  :motivations
      t.text  :expectations
      
      #Mentoring Relationship
      t.text  :aspirations
      t.text  :want_to_be_known_for
      
      t.text    :seeks_mentoring_in_career_orientation
      t.text    :seeks_mentoring_in_career_transition
      t.text    :seeks_mentoring_in_change_management
      t.text    :seeks_mentoring_in_conflict_management
      t.text    :seeks_mentoring_in_corporate_communication
      t.text    :seeks_mentoring_in_cross_cultural_communication
      t.text    :seeks_mentoring_in_cross_cultural_working_practices
      t.text    :seeks_mentoring_in_entreperneurship
      t.text    :seeks_mentoring_in_goal_setting_and_advancement
      t.text    :seeks_mentoring_in_leadership_development
      t.text    :seeks_mentoring_in_optimal_use_of_a_network
      t.text    :seeks_mentoring_in_people_management
      t.text    :seeks_mentoring_in_political_acumen
      t.text    :seeks_mentoring_in_reintegration_and_work_immersion
      t.text    :seeks_mentoring_in_strategic_thinking
      t.text    :seeks_mentoring_in_time_management
      t.text    :seeks_mentoring_in_work_life_balance
      t.text    :seeks_mentoring_in_other_specified
      
      t.text    :goal_1
      t.text    :goal_2
      t.text    :goal_3
      
      ##About the Mentor
      t.string  :ideal_mentor_function
      t.string  :ideal_mentor_sector
      t.string  :ideal_mentor_strength_1
      t.string  :ideal_mentor_strength_2
      t.string  :ideal_mentor_strength_3
      t.string  :ideal_mentor_strength_4
      t.string  :ideal_mentor_strength_5
      t.string  :ideal_mentor_strength_6
      t.text    :ideal_mentor_interests
      t.text    :ideal_mentor_role
      t.string  :mentor_gender_preference
      t.string  :mental_referral_1
      t.string  :mental_referral_2
      t.string  :mental_referral_3
      
      ##Institutional support
      t.string  :company_is_aware_of_program
      t.string  :company_suggested_participation
      t.string  :company_supports_participation
      
      ##Finalizing Application
      t.text    :heard_about_program_from_epwn
      t.text    :heard_about_program_from_previous_participant
      t.text    :heard_about_program_from_epwn_member
      t.text    :heard_about_program_from_company
      t.text    :heard_about_program_in_the_press
      t.text    :heard_about_program_from_other_specified
      t.text    :preference_or_constraint
     
      t.timestamps
    end
    
    
	
    add_index :users, :firstName
    add_index :users, :lastName
    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true

  end
end
