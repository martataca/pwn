class ProfilesController < ApplicationController

 def subregion_options
  render partial: 'subregion_select'
 end

 def new
  @profile = Profile.new
  @profile.user_id = current_user.id
 end

 def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    if @profile.save
     redirect_to @profile
    else
     render 'new'
    end
 end
 
 
  def edit
         
     @profile = Profile.find(params[:id])

  end
  
  def show
     @user = User.find(current_user.id)
     @profile = Profile.find(params[:id])
     render 'users/show'
  end
  
  def update
     @profile = Profile.find(params[:id])
     
     if @profile.update(profile_params)
      redirect_to @profile
     else
      render 'edit'
     end
  end
  
  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy
    redirect_to profiles_path
  end
  
  
 private
  def profile_params
     params.require(:profile).permit(:fullName, :email, :phone_number, :skype_name, :linkedin_profile, :picture, :cv,
          :marital_status, :born_on, :number_children, :city, :country_origin, :country_residence,
          :highest_academic, :main_area, :study_country, :studies_other,
          :years_experience, :number_subordinates, :reporting_level,	:international_experience,
          :company,
          :company_title,
          :job_level,
          :company_area, :company_sector, :company_nation,
          :member,
          :participation_company_program_as_mentor, :participation_company_program_as_mentee,
          :participation_lisbon_epwn_as_mentor, :participation_lisbon_epwn_as_mentee,
          :participation_europe_epwn_as_mentor, :participation_europe_epwn_as_mentee,
          :participation_other_as_mentor, :participation_other_as_mentee, :participation_other_specified,
          :availability_8, :availability_12, :availability_18,
          :availability_monthly_breakfasts, :availability_buddy_contacts,
           
          :career_description,
          :strengh_1, :strengh_2, :strengh_3, :strengh_4, :strengh_5, :strengh_6,
          :interests,
          :self_description,
          :motivations,
          :expectations,
          :aspirations,
          :want_to_be_known_for,          
          :seeks_mentoring_in_career_orientation,
          :seeks_mentoring_in_career_transition,
          :seeks_mentoring_in_change_management,
          :seeks_mentoring_in_conflict_management,
          :seeks_mentoring_in_corporate_communication,
          :seeks_mentoring_in_cross_cultural_communication,
          :seeks_mentoring_in_cross_cultural_working_practices,
          :seeks_mentoring_in_entreperneurship,
          :seeks_mentoring_in_goal_setting_and_advancement,
          :seeks_mentoring_in_leadership_development,
          :seeks_mentoring_in_optimal_use_of_a_network,
          :seeks_mentoring_in_people_management,
          :seeks_mentoring_in_political_acumen,
          :seeks_mentoring_in_reintegration_and_work_immersion,
          :seeks_mentoring_in_strategic_thinking,
          :seeks_mentoring_in_time_management,
          :seeks_mentoring_in_work_life_balance,
          :seeks_mentoring_in_other_specified,								 
          :goal_1, :goal_2, :goal_3,
          :ideal_mentor_function,
          :ideal_mentor_sector,
          :ideal_mentor_strength_1, :ideal_mentor_strength_2, :ideal_mentor_strength_3,
          :ideal_mentor_strength_4, :ideal_mentor_strength_5, :ideal_mentor_strength_6,
          :ideal_mentor_interests,
          :ideal_mentor_role,
          :mentor_gender_preference,
          :mental_referral_1, :mental_referral_2, :mental_referral_3,
          :company_is_aware_of_program,
          :company_suggested_participation,
          :company_supports_participation,
          :heard_about_program_from_epwn,
          :heard_about_program_from_previous_participant,
          :heard_about_program_from_epwn_member,
          :heard_about_program_from_company,
          :heard_about_program_in_the_press,
          :heard_about_program_from_other_specified,								 
          									 
          :preference_or_constraint
									 )
  end

end
