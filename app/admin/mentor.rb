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
    column("Name") { |mentor| mentor.profile.firstName }
    column("Surnames") { |mentor| mentor.profile.surnames }
    column("Email") { |mentor| mentor.profile.email }
    column("Age") { |mentor| mentor.profile.age }
    column("Phone Number") { |mentor| mentor.profile.phone_number }
    column("Skype Name") { |mentor| mentor.profile.skype_name }
    column("Linkedin") { |mentor| mentor.profile.linkedin_profile }
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
    column("Years in Company") { |mentor| mentor.profile.years_in_company }
    column("Number of Subordinates") { |mentor| mentor.profile.number_subordinates }
    column("Reporting Level") { |mentor| mentor.profile.reporting_level }
    column("Job Level") { |mentor| mentor.profile.job_level }
    column("Company Title") { |mentor| mentor.profile.company_title }
    column("Company Job Function") { |mentor| mentor.profile.company_job_function }
    column("Company Sector") { |mentor| mentor.profile.company_sector }
    column("Company Nationality") { |mentor| mentor.profile.company_nation }
    column("Member") { |mentor| mentor.profile.member }
    column("Member since (years)") { |mentor| mentor.profile.member_years }
    column("Previous Participation?") { |mentor| mentor.profile.previous_participation }
    column("Previous Participation Obs") { |mentor| mentor.profile.previous_participation_other }
    column("Availability: 8:30­ - 10:30") { |mentor| mentor.profile.availability_8 }
    column("Availability: 12:30­ - 14:30") { |mentor| mentor.profile.availability_12 }
    column("Availability: 18:00 - ­20:30") { |mentor| mentor.profile.availability_18 }
    column("Availability: None") { |mentor| mentor.profile.availability_no }
    column("Availability: Obs") { |mentor| mentor.profile.availability_obs }
    column("Availability: Breakfasts") { |mentor| mentor.profile.availability_monthly_breakfasts }
    column("Availability: Buddy Contacts") { |mentor| mentor.profile.availability_buddy_contacts }
    column("No Availability for  Other Events") { |mentor| mentor.profile.availability_networking_no }
    column("Permission Data for Benchmarking") { |mentor| mentor.profile.permission_benchmarking }
    column("Permission Data for Promoting") { |mentor| mentor.profile.permission_promoting }
    column("Permission Obs") { |mentor| mentor.profile.permission_other }
    column("Career Description") { |mentor| mentor.profile.career_description }
    column("Self Description") { |mentor| mentor.profile.self_description }
    column("Strength #1") { |mentor| mentor.profile.strengh_1 }
    column("Strength #2") { |mentor| mentor.profile.strengh_2 }
    column("Strength #3") { |mentor| mentor.profile.strengh_3 }
    column("Interests and Characteristics") { |mentor| mentor.profile.interests_and_characteristics }
    column("Goal #1") { |mentor| mentor.profile.goal_1 }
    column("Goal #2") { |mentor| mentor.profile.goal_2 }
    column("Goal #3") { |mentor| mentor.profile.goal_3 }
    column("Motivations") { |mentor| mentor.profile.motivations }
    column("Aspirations") { |mentor| mentor.profile.aspirations }
    column("Wants to be Known for") { |mentor| mentor.profile.want_to_be_known_for }
    column("Seeks mentoring in (main)") { |mentor| mentor.profile.mentoring_in }
    column("Seeks mentoring in (main) Obs") { |mentor| mentor.profile.mentoring_in_other_one }

  end





end