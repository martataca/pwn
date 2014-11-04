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
      t.float   :percentage
      

      
      ## About Myself - Contact Details
      t.string	:firstName
      t.string    :surnames
      t.integer   :age
      t.string	:email
      t.string	:phone_number, 		null: false, default: ""
      t.string	:skype_name, 		default: ""
      t.string	:linkedin_profile, 	default: ""
      t.string	:picture
      t.string	:cv

      ## About Myself - Demographics
      t.integer  :born_on_day
      t.integer  :born_on_month
      t.integer  :born_on_year
      t.string   :sex
      t.string   :country_origin
      t.string   :country_residence
      t.text     :city
      t.text     :marital_status
      t.integer  :number_children

      
      ##About Myself - Studies
      t.string	:highest_academic,      default: "Please select one"
      t.text      :highest_academic_other
      t.string	:main_area,            default: "Please select one"
      t.text      :main_area_other
      t.text	:study_country
      t.text	:studies_other
      
      ##About Myself - Professional Experience
      t.integer	:years_experience
      t.integer   :years_in_company
      t.integer	:number_subordinates
      t.text	:reporting_level
      t.text	:international_experience
      t.text	:company
      t.text      :company_other
      t.text	:company_title
      
      t.text      :job_level
      
      ##About the Company 
      t.string  :company_job_function,     default: "Please select one"
      t.string  :company_sector,           default: "Please select one"
      t.string  :company_nation,           default: "Please select one"
      
      ##EPWN 
      t.text      :member
      t.integer   :member_years
      t.text      :previous_participation
      t.text      :previous_participation_other

      ##Availability
      t.text :availability_8
      t.text :availability_12
      t.text :availability_18
      t.text :availability_no
      t.text :availability_networking_no
      t.text :availability_monthly_breakfasts
      t.text :availability_buddy_contacts
      t.text :availability_obs

      

      ## Permissions
      t.text :permission_benchmarking
      t.text :permission_promoting
      t.text :permission_other
      
      ##Description of Myself
      t.text    :career_description
      t.text    :strengh_1
      t.text    :strengh_2
      t.text    :strengh_3
      t.text    :interests_and_characteristics
      t.text    :self_description
      
      #Mentoring Interest
      t.text  :motivations
      t.text  :goal_1
      t.text  :goal_2
      t.text  :goal_3
      t.text  :aspirations
      t.text  :want_to_be_known_for

      t.text    :mentoring_in
      t.text    :mentoring_in_other_one

      t.text    :mentoring_in_leadership
      t.text    :mentoring_in_change
      t.text    :mentoring_in_conflict
      t.text    :mentoring_in_people
      t.text    :mentoring_in_political
      t.text    :mentoring_in_strategic
      t.text    :mentoring_in_cross_cultural
      t.text    :mentoring_in_networking
      t.text    :mentoring_in_other_two
  
      
      ##About the Mentor
      t.string  :ideal_mentor_function_1
      t.string  :ideal_mentor_sector_1
      t.string  :ideal_mentor_function_2
      t.string  :ideal_mentor_sector_2
      t.string  :ideal_mentor_function_3
      t.string  :ideal_mentor_sector_3
      t.text    :ideal_mentor_func_sec_other
      t.string  :ideal_mentor_strength_1
      t.string  :ideal_mentor_strength_2
      t.string  :ideal_mentor_strength_3
      t.text    :ideal_mentor_interests
      t.text    :ideal_mentor_role
      t.string  :mentor_gender_preference
      t.string  :mentor_referral_1
      t.string  :mentor_referral_2
      t.string  :mentor_referral_3
      
      ##Institutional support
      t.string  :company_is_aware
      t.string  :company_is_not_aware
      t.string  :company_is_sponsor
      t.string  :company_suggested
      t.string  :company_supports
      t.string  :institutional_support_other
      
      ##Finalizing Application
      t.text    :heard_about_program_from_epwn
      t.text    :heard_about_program_from_previous_participant
      t.text    :heard_about_program_from_epwn_member
      t.text    :heard_about_program_from_company
      t.text    :heard_about_program_in_the_press
      t.text    :heard_about_program_from_other_specified
      t.text    :mentee_fee_aware
     
      ##Mentor's own fields
      t.text    :act_as_sounding_board
      t.text    :provide_developmental_feedback
      t.text    :share_experiences
      t.text    :connect_with_relevant_people
      t.text    :mentor_preferred_role
      t.text    :sugestion_1
      t.text    :sugestion_2
      t.text    :sugestion_3
      t.text    :sugestion_4
      t.text    :sugestion_5
      t.text    :sugestion_6 
     
      ##Final Submition
      t.boolean   :submitted,       null: false, default: false
      t.boolean   :select1,         null: false, default: false
      t.boolean   :select2,         null: false, default: false
     
      t.timestamps
    end
    




    
	
    add_index :users, :firstName
    add_index :users, :lastName
    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true

  end
end
