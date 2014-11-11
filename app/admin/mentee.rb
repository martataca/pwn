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
    column("Name") { |mentee| mentee.profile.firstName }
    column("Surnames") { |mentee| mentee.profile.surnames }
    column("Email") { |mentee| mentee.profile.email }
    column("Age") { |mentee| mentee.profile.age }
    column("Phone Number") { |mentee| mentee.profile.phone_number }
    column("Skype Name") { |mentee| mentee.profile.skype_name }
    column("Linkedin") { |mentee| mentee.profile.linkedin_profile }
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
    column("Years in Company") { |mentee| mentee.profile.years_in_company }
    column("Number of Subordinates") { |mentee| mentee.profile.number_subordinates }
    column("Reporting Level") { |mentee| mentee.profile.reporting_level }
    column("Job Level") { |mentee| mentee.profile.job_level }
    column("Company Title") { |mentee| mentee.profile.company_title }
    column("Company Job Function") { |mentee| mentee.profile.company_job_function }
    column("Company Sector") { |mentee| mentee.profile.company_sector }
    column("Company Nationality") { |mentee| mentee.profile.company_nation }
    column("Member") { |mentee| mentee.profile.member }
    column("Member since (years)") { |mentee| mentee.profile.member_years }
    column("Previous Participation?") { |mentee| mentee.profile.previous_participation }
    column("Previous Participation Obs") { |mentee| mentee.profile.previous_participation_other }
    column("Availability: 8:30­ - 10:30") { |mentee| mentee.profile.availability_8 }
    column("Availability: 12:30­ - 14:30") { |mentee| mentee.profile.availability_12 }
    column("Availability: 18:00 - ­20:30") { |mentee| mentee.profile.availability_18 }
    column("Availability: None") { |mentee| mentee.profile.availability_no }
    column("Availability: Obs") { |mentee| mentee.profile.availability_obs }
    column("Availability: Breakfasts") { |mentee| mentee.profile.availability_monthly_breakfasts }
    column("Availability: Buddy Contacts") { |mentee| mentee.profile.availability_buddy_contacts }
    column("No Availability for  Other Events") { |mentee| mentee.profile.availability_networking_no }
    column("Permission Data for Benchmarking") { |mentee| mentee.profile.permission_benchmarking }
    column("Permission Data for Promoting") { |mentee| mentee.profile.permission_promoting }
    column("Permission Obs") { |mentee| mentee.profile.permission_other }
    column("Career Description") { |mentee| mentee.profile.career_description }
    column("Self Description") { |mentee| mentee.profile.self_description }
    column("Strength #1") { |mentee| mentee.profile.strengh_1 }
    column("Strength #2") { |mentee| mentee.profile.strengh_2 }
    column("Strength #3") { |mentee| mentee.profile.strengh_3 }
    column("Interests and Characteristics") { |mentee| mentee.profile.interests_and_characteristics }
    column("Goal #1") { |mentee| mentee.profile.goal_1 }
    column("Goal #2") { |mentee| mentee.profile.goal_2 }
    column("Goal #3") { |mentee| mentee.profile.goal_3 }
    column("Motivations") { |mentee| mentee.profile.motivations }
    column("Wants to be") { |mentee| mentee.profile.aspirations }
    column("Wants to be Known for") { |mentee| mentee.profile.want_to_be_known_for }
    column("Seeks mentoring in (main)") { |mentee| mentee.profile.mentoring_in }
    column("Seeks mentoring in (main) Obs") { |mentee| mentee.profile.mentoring_in_other_one }

  end





end
