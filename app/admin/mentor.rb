ActiveAdmin.register Mentor do


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


  csv do    
    #Tab 1
    column("Name") { |mentor| mentor.profile.firstName }
    column("Surnames") { |mentor| mentor.profile.surnames }
    column("Email") { |mentor| mentor.profile.email }    
    column("Phone Number") { |mentor| mentor.profile.phone_number }
    column("Skype Name") { |mentor| mentor.profile.skype_name }
    column("Linkedin") { |mentor| mentor.profile.linkedin_profile }
    
    column("Age") { |mentor| mentor.profile.age }
    column("Born on Day") { |mentor| mentor.profile.born_on_day }
    column("Born on Month") { |mentor| mentor.profile.born_on_month }
    column("Born on Year") { |mentor| mentor.profile.born_on_year }
    #Mentor    
    column("Sex") { |mentor| mentor.profile.sex }
    #All
    column("Nacionality") { |mentor| mentor.profile.country_origin }
    column("Country of Residence") { |mentor| mentor.profile.country_residence }
    column("City of Residence") { |mentor| mentor.profile.city }
    column("Marital Status") { |mentor| mentor.profile.marital_status }
    column("Number of Children") { |mentor| mentor.profile.number_children }
    
    column("Highest Academic Title") { |mentor| mentor.profile.highest_academic }
    column("Highest Academic Title Obs") { |mentor| mentor.profile.highest_academic_other }
    column("Main Area of Studies") { |mentor| mentor.profile.main_area }
    column("Main Area of Studies Obs") { |mentor| mentor.profile.main_area_other }
    column("Country of Sudies") { |mentor| mentor.profile.study_country }
    column("Country of Sudies Obs") { |mentor| mentor.profile.studies_other }
    
    column("Professional Experience (years)") { |mentor| mentor.profile.years_experience }
    column("International Experience") { |mentor| mentor.profile.international_experience }
    
    column("Company") { |mentor| mentor.profile.company }
    column("Company Obs") { |mentor| mentor.profile.company_other }
    column("Company Title") { |mentor| mentor.profile.company_title }
    column("Years in Company") { |mentor| mentor.profile.years_in_company }
    column("Number of Subordinates") { |mentor| mentor.profile.number_subordinates }
    
    column("Company Job Function") { |mentor| mentor.profile.company_job_function }
    column("Company Sector") { |mentor| mentor.profile.company_sector }
    column("Company Nationality") { |mentor| mentor.profile.company_nation }
    
    column("Job Level") { |mentor| mentor.profile.job_level }
    column("Reporting Level") { |mentor| mentor.profile.reporting_level }
    
    
    #Tab 2
    column("Member") { |mentor| mentor.profile.member }
    column("Member since (years)") { |mentor| mentor.profile.member_years }
    
    column("Previous Participation?") { |mentor| mentor.profile.previous_participation }
    column("Previous Participation Obs") { |mentor| mentor.profile.previous_participation_other }
    
    #Tab 3
    column("Availability: 8:30­ - 10:30") { |mentor| mentor.profile.availability_8 }
    column("Availability: 12:30­ - 14:30") { |mentor| mentor.profile.availability_12 }
    column("Availability: 18:00 - ­20:30") { |mentor| mentor.profile.availability_18 }
    column("Availability: None") { |mentor| mentor.profile.availability_no }
        
    column("Availability: Breakfasts") { |mentor| mentor.profile.availability_monthly_breakfasts }
    #Mentee
    # column("Availability: Buddy Contacts") { |mentee| mentee.profile.availability_buddy_contacts }
    #All
    column("No Availability for  Other Events") { |mentor| mentor.profile.availability_networking_no }
    
    column("Availability: Obs") { |mentor| mentor.profile.availability_obs }
    
    column("Permission Data for Benchmarking") { |mentor| mentor.profile.permission_benchmarking }
    column("Permission Data for Promoting") { |mentor| mentor.profile.permission_promoting }
    column("Permission Obs") { |mentor| mentor.profile.permission_other }
    
    #Tab 4
    column("Career Description") { |mentor| mentor.profile.career_description }
    #??? column("Self Description") { |mentee| mentee.profile.self_description }
    
    column("Strength #1") { |mentor| mentor.profile.strengh_1 }
    column("Strength #2") { |mentor| mentor.profile.strengh_2 }
    column("Strength #3") { |mentor| mentor.profile.strengh_3 }
    
    column("Interests and Characteristics") { |mentor| mentor.profile.interests_and_characteristics }
    
    #Tab 5    
    column("Motivations") { |mentor| mentor.profile.motivations }
    
    column("Aspirations") { |mentor| mentor.profile.aspirations }
    
    #Mentee
    # column("Goal #1") { |mentee| mentee.profile.goal_1 }
    # column("Goal #2") { |mentee| mentee.profile.goal_2 }
    # column("Goal #3") { |mentee| mentee.profile.goal_3 }
    
    #Mentee
    # column("Wants to be Known for") { |mentee| mentee.profile.want_to_be_known_for }
    
    #Mentor changes name of collumn
    column("Seeks mentoring in (main)") { |mentor| mentor.profile.mentoring_in }
    column("Seeks mentoring in (main) Obs") { |mentor| mentor.profile.mentoring_in_other_one }
    
    #Mentor changes name of collumn
    column("Seeks mentoring in Leadership Development") { |mentor| mentor.profile.mentoring_in_leadership }
    column("Seeks mentoring in Change Management") { |mentor| mentor.profile.mentoring_in_change_mng }
    column("Seeks mentoring in Conflict Management") { |mentor| mentor.profile.mentoring_in_conflict }
    column("Seeks mentoring in People Management") { |mentor| mentor.profile.mentoring_in_people }
    column("Seeks mentoring in Political Acumen") { |mentor| mentor.profile.mentoring_in_political }
    column("Seeks mentoring in Strategic Thinking") { |mentor| mentor.profile.mentoring_in_strategic }
    column("Seeks mentoring in Cross­-Cultural Working Practices") { |mentor| mentor.profile.mentoring_in_cross_cultural }
    column("Seeks mentoring in Networking") { |mentor| mentor.profile.mentoring_in_networking }
    column("Seeks mentoring in Other") { |mentor| mentor.profile.mentoring_in_other_two }

    #Mentor
    column("Play role: Act as sounding board") { |mentor| mentor.profile.act_as_sounding_board }
    column("Play role: Provide developmental feedback") { |mentor| mentor.profile.provide_developmental_feedback }
    column("Play role: Share experiences") { |mentor| mentor.profile.share_experiences }
    column("Play role: Connect with relevant people") { |mentor| mentor.profile.connect_with_relevant_people }
    column("Play role: Other") { |mentor| mentor.profile.mentor_preferred_role }
    
    #Tab 6 - Mentee
    # column("Ideal mentor function #1") { |mentee| mentee.profile.ideal_mentor_function_1 }
    # column("Ideal mentor sector #1") { |mentee| mentee.profile.ideal_mentor_sector_1 }
    # column("Ideal mentor function #2") { |mentee| mentee.profile.ideal_mentor_function_2 }
    # column("Ideal mentor sector #2") { |mentee| mentee.profile.ideal_mentor_sector_2 }
    # column("Ideal mentor function #3") { |mentee| mentee.profile.ideal_mentor_function_3 }
    # column("Ideal mentor sector #3") { |mentee| mentee.profile.ideal_mentor_sector_3 }
     
    # column("Ideal mentor strength 1") { |mentee| mentee.profile.ideal_mentor_strength_1 }
    # column("Ideal mentor strength 2") { |mentee| mentee.profile.ideal_mentor_strength_2 }
    # column("Ideal mentor strength 3") { |mentee| mentee.profile.ideal_mentor_strength_3 }
     
    # column("Ideal mentor interests") { |mentee| mentee.profile.ideal_mentor_interests }
     
    # column("Ideal mentor role") { |mentee| mentee.profile.ideal_mentor_role }
     
    # column("Mentor gender preference") { |mentee| mentee.profile.mentor_gender_preference }
     
    # column("Mentor referral 1") { |mentee| mentee.profile.mentor_referral_1 }
    # column("Mentor referral 2") { |mentee| mentee.profile.mentor_referral_2 }
    # column("Mentor referral 3") { |mentee| mentee.profile.mentor_referral_3 }

    #Tab 7
    column("Company support: company is not aware") { |mentor| mentor.profile.company_is_not_aware }
    column("Company support: company is aware") { |mentor| mentor.profile.company_is_aware }
    column("Company support: company suggested") { |mentor| mentor.profile.company_suggested }
    column("Company support: company is sponsor") { |mentor| mentor.profile.company_is_sponsor }
    column("Company support: company supports") { |mentor| mentor.profile.company_supports }
    column("Company support: other") { |mentor| mentor.profile.institutional_support_other }
    
    #Mentor
    column("Mentor or mentee suggestion #1") { |mentor| mentor.profile.suggestion_1 }
    column("Mentor or mentee suggestion #2") { |mentor| mentor.profile.suggestion_2 }
    column("Mentor or mentee suggestion #3") { |mentor| mentor.profile.suggestion_3 }
    column("Mentor or mentee suggestion #4") { |mentor| mentor.profile.suggestion_4 }
    column("Mentor or mentee suggestion #5") { |mentor| mentor.profile.suggestion_5 }
    column("Mentor or mentee suggestion #6") { |mentor| mentor.profile.suggestion_6 }
    
    #Tab 8
    column("Heard about program from: PWN communication and events") { |mentor| mentor.profile.heard_about_program_from_epwn }
    column("Heard about program from: A participant in a previous edition of the program") { |mentor| mentor.profile.heard_about_program_from_previous_participant }
    column("Heard about program from: A PWN member") { |mentor| mentor.profile.heard_about_program_from_epwn_member }
    column("Heard about program from: My company") { |mentor| mentor.profile.heard_about_program_from_company }
    column("Heard about program from: The press") { |mentor| mentor.profile.heard_about_program_in_the_press }
    column("Heard about program from: Other") { |mentor| mentor.profile.heard_about_program_from_other_specified }
    
    #Mentee
    # column("Aware of fee") { |mentee| mentee.profile.mentee_fee_aware }
    
    column("Aware of mentoring contract") { |mentor| mentor.profile.mentoring_contract_aware }

  end





end