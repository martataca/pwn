class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      
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
  end
end
