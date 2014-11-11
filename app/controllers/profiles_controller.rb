class ProfilesController < ApplicationController


 def subregion_options
  render partial: 'subregion_select'
 end

 def new
  @profile = Profile.new
  @profile.user_id = current_user.id
  @profile.email = current_user.email
  @profile.firstName = current_user.firstName
  @profile.surnames = current_user.lastName
  @profile.save
 end

 def create
    @user = User.find(current_user.id)
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    if @profile.save
      calc_age
     redirect_to user_path(@user.id)
    else
     render 'new'
    end
 end
 
 
  def edit
   @profile = Profile.find(params[:id])
   if current_user.id != @profile.user_id    
    flash[:error] = "Please access one of your own pages"
    redirect_to root_url
   end
  end
  
  def show
    @user = User.find(current_user.id)
    @profile = Profile.find(params[:id])

   if current_user.id != @profile.user_id    
    flash[:error] = "Please access one of your own pages"
    redirect_to root_url
   end
      
    if @profile.percentage == 100
      @profile.submitted = true
      @select_res = select1?(@profile)
      @profile.select1 =  @select_res
      if @profile.select1 == true
         @profile.save
      else
        @profile.select1 = false
        @profile.save
      end
      make_app_pdf_mentee
    end
     
    
  end
  
  def update
     @user = User.find(current_user.id)
     @profile = Profile.find(params[:id])
     
     if @profile.update(profile_params)
      calc_age
      redirect_to user_path(@user.id)
     else
      render 'edit'
     end
  end
  
  
  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy
    redirect_to profiles_path
  end
  
def age_at(date, dob)
  day_diff = date.day - DateTime.strptime(dob, "%d/%m/%Y").day
  month_diff = date.month - DateTime.strptime(dob, "%d/%m/%Y").month - (day_diff < 0 ? 1 : 0)
  date.year - DateTime.strptime(dob, "%d/%m/%Y").year - (month_diff < 0 ? 1 : 0)
end
 

def available?(prof)
 if prof.availability_no == "Yes"
  return false
 else
  return true
 end
end


def select1?(prof)
  if prof.submitted
    if prof.years_experience >= 5
      return available?(prof)
   end
  end
end

def calc_age
if @profile.born_on_day.present? and @profile.born_on_month.present? and @profile.born_on_year.present?
  @born_on = ""
  @born_on = @born_on + @profile.born_on_day.to_s + "/" + @profile.born_on_month.to_s + "/" + @profile.born_on_year.to_s
  @profile.age = age_at(Date.today, @born_on)
  @profile.save
end
end

def make_app_pdf_mentee
@footerstring = ""
@footerstring = @user.type + "_" + @profile.firstName + "_" + @profile.surnames
    respond_to do |format|
      format.html
      format.pdf do
               render :pdf => "#{@profile.id}.pdf",
                 :template => 'profiles/App.pdf.erb',
                 :layout => 'pdf',
                 :footer => {:left => '[date]',
                 :right  => "#{@footerstring}"
                 },
                 :header => { :right => '[page] of [topage]' },
                 :save_to_file => Rails.root.join('public/uploads/profile/application', "#{@profile.id}.pdf")
                
      end
    end
end


 private
  def profile_params
     params.require(:profile).permit(
      :firstName,
      :surnames,
      :age,
      :email,
      :phone_number,
      :skype_name,
      :linkedin_profile,
      :picture,
      :cv,
      :born_on,
      :born_on_day,
      :born_on_month,
      :born_on_year,
      :sex,
      :country_origin,
      :country_residence,
      :city,
      :marital_status,
      :number_children,
      :highest_academic,
      :highest_academic_other,
      :main_area,
      :main_area_other,
      :study_country,
      :studies_other,
      :years_experience,
      :years_in_company,
      :number_subordinates,
      :reporting_level,
      :international_experience,
      :company,
      :company_other,
      :company_title,
      :job_level,
      :company_job_function,
      :company_sector,
      :company_nation,
      :member,
      :member_years,
      :previous_participation,
      :previous_participation_other,
      :availability_8,
      :availability_12,
      :availability_18,
      :availability_monthly_breakfasts,
      :availability_buddy_contacts,
      :availability_obs,
      :availability_no,
      :availability_networking_no,
      :permission_benchmarking,
      :permission_promoting,
      :permission_other,
      :career_description,
      :strengh_1,
      :strengh_2,
      :strengh_3,
      :interests_and_characteristics,
      :self_description,
      :motivations,
      :goal_1,
      :goal_2,
      :goal_3,
      :aspirations,
      :want_to_be_known_for,
      :mentoring_in,
      :mentoring_in_other_one,
      :mentoring_in_leadership,
      :mentoring_in_change_mng,
      :mentoring_in_conflict,
      :mentoring_in_people,
      :mentoring_in_political,
      :mentoring_in_strategic,
      :mentoring_in_cross_cultural,
      :mentoring_in_networking,
      :mentoring_in_other_two,
      :ideal_mentor_function_1,
      :ideal_mentor_sector_1,
      :ideal_mentor_function_2,
      :ideal_mentor_sector_2,
      :ideal_mentor_function_3,
      :ideal_mentor_sector_3,
      :ideal_mentor_func_sec_other,
      :ideal_mentor_strength_1,
      :ideal_mentor_strength_2,
      :ideal_mentor_strength_3,
      :ideal_mentor_interests,
      :ideal_mentor_role,
      :mentor_gender_preference,
      :mentor_referral_1,
      :mentor_referral_2,
      :mentor_referral_3,
      :company_is_aware,
      :company_is_not_aware,
      :company_is_sponsor,
      :company_suggested,
      :company_supports,
      :institutional_support_other,
      :heard_about_program_from_epwn,
      :heard_about_program_from_previous_participant,
      :heard_about_program_from_epwn_member,
      :heard_about_program_from_company,
      :heard_about_program_in_the_press,
      :heard_about_program_from_other_specified,
      :mentee_fee_aware,
      :mentoring_contract_aware,
      :act_as_sounding_board,
      :provide_developmental_feedback,
      :share_experiences,
      :connect_with_relevant_people,
      :mentor_preferred_role,
      :sugestion_1,
      :sugestion_2,
      :sugestion_3,
      :sugestion_4,
      :sugestion_5,
      :sugestion_6,
      :submitted,
      :select1,
      :select2
									 )
  end

end
