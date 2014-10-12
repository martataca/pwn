class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      ## Database authenticatable
      t.string :type,               null: false                  
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
      
      t.string :picture
      t.string :cv
      ## About Myself - Contacts
      t.string :phone_number, 		null: false, default: ""
      t.string :skype_name, 		default: ""
      t.string :linkedin_profile, 	default: ""

      ## About Myself - Demographics
      t.integer  :age
      t.string   :sex
      t.string   :nationality
      t.string   :city
      t.string   :marital_status
      t.integer  :number_children
      
      ##About Myself - Studies
      t.string   :main_area
      t.string   :highest_academic
      t.string   :study_country
      
      ##About Myself - Professional
      t.integer  :years_experience
      t.integer  :number_subordinates
      t.string   :reporting_level
      t.string   :international_experience
      t.string   :company
      t.string   :company_title
      
      
      ##About the Company 
      t.string   :company_area
      t.string   :company_sector
      t.string   :company_nation
      
      ##EPWN 
      t.boolean  :member
      
     
      t.timestamps
    end
    
    
	
    add_index :users, :firstName
    add_index :users, :lastName
    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true

  end
end
