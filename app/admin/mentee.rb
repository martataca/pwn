ActiveAdmin.register Mentee do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


  index do

    column "Picture" do |user|
      if Profile.exists?(:user_id => user.id)
        image_tag user.profile.picture, class: 'profile_picture_thumbnail_xs'
      end
    end

    column "First Name", :firstName
    column "Last Name",  :lastName
    column :email


    column "Phone Number" do |user|
      if Profile.exists?(:user_id => user.id)
        user.profile.phone_number
      end
    end

    column "Company" do |user|
      if Profile.exists?(:user_id => user.id)
        user.profile.company
      end
    end

    column "Application Completeness in %" do |user|
      if Profile.exists?(:user_id => user.id)
        @profile = Profile.where(user_id: user.id).first
        if @profile.percentage.present?
          @pure = user.profile.percentage
          @percentage = @pure.floor.to_i 
          @percentage
        end
      end
    end

    column "Selection 1" do |user|
      if Profile.exists?(:user_id => user.id)
         @profile = Profile.where(user_id: user.id).first
         if @profile.select1.present?
            user.profile.select1
         end
      end
    end

        column "Submitted" do |user|
      if Profile.exists?(:user_id => user.id)
         @profile = Profile.where(user_id: user.id).first
         if @profile.submitted.present?
            user.profile.submitted
         end
      end
    end



    actions :defaults => false do |user|
      if Profile.exists?(:user_id => user.id)
        @iduser = user.id
        @profile = Profile.where(user_id: @iduser).first
        link_to "View", admin_profile_path(@profile.id)
      else
        link_to "View", admin_user_path(user)
      end
    end
  end

filter :profile_select1, :label => 'Selection 1', :as  => :select
filter :profile_submitted, :label => 'Application Submitted', :as  => :select
filter :profile_company, :label => 'Company', :as  => :string


  csv do
    #Tab 1
    column("Name") { |mentee| mentee.profile.firstName }
    column("Surnames") { |mentee| mentee.profile.surnames }
    column("Email") { |mentee| mentee.profile.email }    
    column("Phone Number") { |mentee| mentee.profile.phone_number }
    column("Skype Name") { |mentee| mentee.profile.skype_name }
    column("Linkedin") { |mentee| mentee.profile.linkedin_profile }
    
    column("Age") { |mentee| mentee.profile.age }
    column("Born on Day") { |mentee| mentee.profile.born_on_day }
    column("Born on Month") { |mentee| mentee.profile.born_on_month }
    column("Born on Year") { |mentee| mentee.profile.born_on_year }
    #Mentor    
    # column("Sex") { |mentor| mentor.profile.sex }
    #All
    column("Nacionality") { |mentee| mentee.profile.country_origin }
    column("Country of Residence") { |mentee| mentee.profile.country_residence }
    column("City of Residence") { |mentee| mentee.profile.city }
    column("Marital Status") { |mentee| mentee.profile.marital_status }
    column("Number of Children") { |mentee| mentee.profile.number_children }
    
    column("Highest Academic Title") { |mentee| mentee.profile.highest_academic }
    column("Highest Academic Title Obs") { |mentee| mentee.profile.highest_academic_other }
    column("Main Area of Studies") { |mentee| mentee.profile.main_area }
    column("Main Area of Studies Obs") { |mentee| mentee.profile.main_area_other }
    column("Country of Sudies") { |mentee| mentee.profile.study_country }
    column("Country of Sudies Obs") { |mentee| mentee.profile.studies_other }
    
    column("Professional Experience (years)") { |mentee| mentee.profile.years_experience }
    column("International Experience") { |mentee| mentee.profile.international_experience }
    
    column("Company") { |mentee| mentee.profile.company }
    column("Company Obs") { |mentee| mentee.profile.company_other }
    column("Company Title") { |mentee| mentee.profile.company_title }
    column("Years in Company") { |mentee| mentee.profile.years_in_company }
    column("Number of Subordinates") { |mentee| mentee.profile.number_subordinates }
    
    column("Company Job Function") { |mentee| mentee.profile.company_job_function }
    column("Company Sector") { |mentee| mentee.profile.company_sector }
    column("Company Nationality") { |mentee| mentee.profile.company_nation }
    
    column("Job Level") { |mentee| mentee.profile.job_level }
    column("Reporting Level") { |mentee| mentee.profile.reporting_level }
    
    
    #Tab 2
    column("Member") { |mentee| mentee.profile.member }
    column("Member since (years)") { |mentee| mentee.profile.member_years }
    
    column("Previous Participation?") { |mentee| mentee.profile.previous_participation }
    column("Previous Participation Obs") { |mentee| mentee.profile.previous_participation_other }
    
    #Tab 3
    column("Availability: 8:30­ - 10:30") { |mentee| mentee.profile.availability_8 }
    column("Availability: 12:30­ - 14:30") { |mentee| mentee.profile.availability_12 }
    column("Availability: 18:00 - ­20:30") { |mentee| mentee.profile.availability_18 }
    column("Availability: None") { |mentee| mentee.profile.availability_no }
        
    column("Availability: Breakfasts") { |mentee| mentee.profile.availability_monthly_breakfasts }
    #Mentee
    column("Availability: Buddy Contacts") { |mentee| mentee.profile.availability_buddy_contacts }
    #All
    column("No Availability for  Other Events") { |mentee| mentee.profile.availability_networking_no }
    
    column("Availability: Obs") { |mentee| mentee.profile.availability_obs }
    
    column("Permission Data for Benchmarking") { |mentee| mentee.profile.permission_benchmarking }
    column("Permission Data for Promoting") { |mentee| mentee.profile.permission_promoting }
    column("Permission Obs") { |mentee| mentee.profile.permission_other }
    
    #Tab 4
    column("Career Description") { |mentee| mentee.profile.career_description }
    #??? column("Self Description") { |mentee| mentee.profile.self_description }
    
    column("Strength #1") { |mentee| mentee.profile.strengh_1 }
    column("Strength #2") { |mentee| mentee.profile.strengh_2 }
    column("Strength #3") { |mentee| mentee.profile.strengh_3 }
    
    column("Interests and Characteristics") { |mentee| mentee.profile.interests_and_characteristics }
    
    #Tab 5    
    column("Motivations") { |mentee| mentee.profile.motivations }
    
    column("Aspirations") { |mentee| mentee.profile.aspirations }
    
    #Mentee
    column("Goal #1") { |mentee| mentee.profile.goal_1 }
    column("Goal #2") { |mentee| mentee.profile.goal_2 }
    column("Goal #3") { |mentee| mentee.profile.goal_3 }

    #Mentee
    column("Wants to be Known for") { |mentee| mentee.profile.want_to_be_known_for }
    
    #Mentor changes name of collumn
    column("Seeks mentoring in (main)") { |mentee| mentee.profile.mentoring_in }
    column("Seeks mentoring in (main) Obs") { |mentee| mentee.profile.mentoring_in_other_one }
    
    #Mentor changes name of collumn
    column("Seeks mentoring in Leadership Development") { |mentee| mentee.profile.mentoring_in_leadership }
    column("Seeks mentoring in Change Management") { |mentee| mentee.profile.mentoring_in_change_mng }
    column("Seeks mentoring in Conflict Management") { |mentee| mentee.profile.mentoring_in_conflict }
    column("Seeks mentoring in People Management") { |mentee| mentee.profile.mentoring_in_people }
    column("Seeks mentoring in Political Acumen") { |mentee| mentee.profile.mentoring_in_political }
    column("Seeks mentoring in Strategic Thinking") { |mentee| mentee.profile.mentoring_in_strategic }
    column("Seeks mentoring in Cross­-Cultural Working Practices") { |mentee| mentee.profile.mentoring_in_cross_cultural }
    column("Seeks mentoring in Networking") { |mentee| mentee.profile.mentoring_in_networking }
    column("Seeks mentoring in Other") { |mentee| mentee.profile.mentoring_in_other_two }

    #Mentor
    # column("Play role: Act as sounding board") { |mentee| mentee.profile.act_as_sounding_board }
    # column("Play role: Provide developmental feedback") { |mentee| mentee.profile.provide_developmental_feedback }
    # column("Play role: Share experiences") { |mentee| mentee.profile.share_experiences }
    # column("Play role: Connect with relevant people") { |mentee| mentee.profile.connect_with_relevant_people }
    # column("Play role: Other") { |mentee| mentee.profile.mentor_preferred_role }
    
    #Tab 6 - Mentee
    column("Ideal mentor function #1") { |mentee| mentee.profile.ideal_mentor_function_1 }
    column("Ideal mentor sector #1") { |mentee| mentee.profile.ideal_mentor_sector_1 }
    column("Ideal mentor function #2") { |mentee| mentee.profile.ideal_mentor_function_2 }
    column("Ideal mentor sector #2") { |mentee| mentee.profile.ideal_mentor_sector_2 }
    column("Ideal mentor function #3") { |mentee| mentee.profile.ideal_mentor_function_3 }
    column("Ideal mentor sector #3") { |mentee| mentee.profile.ideal_mentor_sector_3 }
    
    column("Ideal mentor strength #1") { |mentee| mentee.profile.ideal_mentor_strength_1 }
    column("Ideal mentor strength #2") { |mentee| mentee.profile.ideal_mentor_strength_2 }
    column("Ideal mentor strength #3") { |mentee| mentee.profile.ideal_mentor_strength_3 }
    
    column("Ideal mentor interests") { |mentee| mentee.profile.ideal_mentor_interests }
    
    column("Ideal mentor role") { |mentee| mentee.profile.ideal_mentor_role }
    
    column("Mentor gender preference") { |mentee| mentee.profile.mentor_gender_preference }
    
    column("Mentor referral #1") { |mentee| mentee.profile.mentor_referral_1 }
    column("Mentor referral #2") { |mentee| mentee.profile.mentor_referral_2 }
    column("Mentor referral #3") { |mentee| mentee.profile.mentor_referral_3 }

    #Tab 7
    column("Company support: company is not aware") { |mentee| mentee.profile.company_is_not_aware }
    column("Company support: company is aware") { |mentee| mentee.profile.company_is_aware }
    column("Company support: company suggested") { |mentee| mentee.profile.company_suggested }
    column("Company support: company is sponsor") { |mentee| mentee.profile.company_is_sponsor }
    column("Company support: company supports") { |mentee| mentee.profile.company_supports }
    column("Company support: other") { |mentee| mentee.profile.institutional_support_other }
    
    #Mentor
    # column("Mentor or mentee suggestion 1") { |mentee| mentee.profile.suggestion_1 }
    # column("Mentor or mentee suggestion 2") { |mentee| mentee.profile.suggestion_2 }
    # column("Mentor or mentee suggestion 3") { |mentee| mentee.profile.suggestion_3 }
    # column("Mentor or mentee suggestion 4") { |mentee| mentee.profile.suggestion_4 }
    # column("Mentor or mentee suggestion 5") { |mentee| mentee.profile.suggestion_5 }
    # column("Mentor or mentee suggestion 6") { |mentee| mentee.profile.suggestion_6 }
    
    #Tab 8
    column("Heard about program from: PWN communication and events") { |mentee| mentee.profile.heard_about_program_from_epwn }
    column("Heard about program from: A participant in a previous edition of the program") { |mentee| mentee.profile.heard_about_program_from_previous_participant }
    column("Heard about program from: A PWN member") { |mentee| mentee.profile.heard_about_program_from_epwn_member }
    column("Heard about program from: My company") { |mentee| mentee.profile.heard_about_program_from_company }
    column("Heard about program from: The press") { |mentee| mentee.profile.heard_about_program_in_the_press }
    column("Heard about program from: Other") { |mentee| mentee.profile.heard_about_program_from_other_specified }
    
    #Mentee
    column("Aware of fee") { |mentee| mentee.profile.mentee_fee_aware }
    
    column("Aware of mentoring contract") { |mentee| mentee.profile.mentoring_contract_aware }

  end





end
