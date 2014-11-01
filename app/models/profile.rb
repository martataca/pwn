class Profile < ActiveRecord::Base
   belongs_to :user
   mount_uploader :picture, PictureUploader
   mount_uploader :cv, ResumeUploader
  
 def application_percentage(id)
   @found_profile = Profile.find(id)
   
   #Tab 1
   @percentage = 0.0
   if @found_profile.firstName.present?
     @percentage += 1
   end
   if @found_profile.surnames.present?
     @percentage += 1
   end
   if @found_profile.email.present?
     @percentage += 1
   end
   if @found_profile.phone_number.present?
     @percentage += 1
   end
   if @found_profile.skype_name.present?
     @percentage += 1
   end
   if @found_profile.linkedin_profile.present?
     @percentage += 1
   end
   if @found_profile.picture.present?
     @percentage += 1
   end
   
   
   if @found_profile.born_on.present?
     @percentage += 1
   end
   if @found_profile.country_origin.present?
     @percentage += 1
   end
   if @found_profile.city.present?
     @percentage += 1
   end
   if @found_profile.country_residence.present?
     @percentage += 1
   end
   if @found_profile.marital_status.present?
     @percentage += 1
   end
   if @found_profile.number_children.present?
     @percentage += 1
   end
   
   
   if @found_profile.highest_academic.present? && @found_profile.highest_academic != "Please select one"
     @percentage += 1
   end
   if @found_profile.main_area.present? && @found_profile.main_area != "Please select one"
     @percentage += 1
   end
   if @found_profile.study_country.present?
     @percentage += 1
   end
   
   
   if @found_profile.years_experience.present?
     @percentage += 1
   end
   if @found_profile.international_experience.present?
     @percentage += 1
   end
   if @found_profile.cv.present?
     @percentage += 1
   end
   
   
   if @found_profile.company.present? && @found_profile.company != "Please select one"
     @percentage += 1
   end
   if @found_profile.company_title.present?
     @percentage += 1
   end
   if @found_profile.years_in_company.present?
     @percentage += 1
   end
   if @found_profile.number_subordinates.present?
     @percentage += 1
   end
   
   
   if @found_profile.company_sector.present? && @found_profile.company_sector != "Please select one"
     @percentage += 1
   end
   if @found_profile.company_nation.present?
     @percentage += 1
   end
   
   
   if @found_profile.job_level.present?
     @percentage += 1
   end
   if @found_profile.reporting_level.present?
     @percentage += 1
   end
   #27

   
   #Tab 2
   if @found_profile.member.present?
     @percentage += 1
   end
   if @found_profile.previous_participation.present?
     @percentage += 1
   end
   #29

      
   #Tab 3
   if @found_profile.availability_8 == "Available" or @found_profile.availability_12 == "Available" or
      @found_profile.availability_18 == "Available" 
     @percentage += 1
   end
   
   if @found_profile.availability_monthly_breakfasts == "Available" or @found_profile.availability_buddy_contacts == "Available"
     @percentage += 1
   end
   
   if @found_profile.availability_obs.present?
     @percentage += 1
   end
   #32
 
   
   #Tab 4
   if @found_profile.career_description.present?
     @percentage += 1
   end
   
   if @found_profile.strengh_1.present?
     @percentage += 1
   end
   if @found_profile.strengh_2.present?
     @percentage += 1
   end
   if @found_profile.strengh_3.present?
     @percentage += 1
   end
   
   if @found_profile.interests_and_characteristics.present?
     @percentage += 1
   end
   #37

   
   #Tab 5
   if @found_profile.motivations.present?
     @percentage += 1
   end
   
   if @found_profile.goal_1.present?
     @percentage += 1
   end
   if @found_profile.goal_2.present?
     @percentage += 1
   end
   if @found_profile.goal_3.present?
     @percentage += 1
   end
   
   if @found_profile.aspirations.present?
     @percentage += 1
   end
   
   if @found_profile.want_to_be_known_for.present?
     @percentage += 1
   end
   
   if @found_profile.mentoring_in.present?
     @percentage += 1
   end
   
   if (@found_profile.mentoring_in_leadership.present? && @found_profile.mentoring_in_leadership != "No") or
      (@found_profile.mentoring_in_change.present? && @found_profile.mentoring_in_change != "No") or
      (@found_profile.mentoring_in_conflict.present? && @found_profile.mentoring_in_conflict != "No") or
      (@found_profile.mentoring_in_people.present? && @found_profile.mentoring_in_people != "No") or
      (@found_profile.mentoring_in_political.present? && @found_profile.mentoring_in_political != "No") or
      (@found_profile.mentoring_in_strategic.present? && @found_profile.mentoring_in_strategic != "No") or
      (@found_profile.mentoring_in_cross_cultural.present? && @found_profile.mentoring_in_cross_cultural != "No") or
      (@found_profile.mentoring_in_networking.present? && @found_profile.mentoring_in_networking != "No") or
      (@found_profile.mentoring_in_other_two.present? && @found_profile.mentoring_in_other_two != "")
     @percentage += 1
   end
   #45

   
   #Tab 6
   if @found_profile.ideal_mentor_function_1.present?
     @percentage += 1
   end   
   if @found_profile.ideal_mentor_function_2.present?
     @percentage += 1
   end
   if @found_profile.ideal_mentor_function_3.present?
     @percentage += 1
   end
   if @found_profile.ideal_mentor_sector_1.present?
     @percentage += 1
   end   
   if @found_profile.ideal_mentor_sector_2.present?
     @percentage += 1
   end
   if @found_profile.ideal_mentor_sector_3.present?
     @percentage += 1
   end
   
   if @found_profile.ideal_mentor_strength_1.present?
     @percentage += 1
   end   
   if @found_profile.ideal_mentor_strength_2.present?
     @percentage += 1
   end
   if @found_profile.ideal_mentor_strength_3.present?
     @percentage += 1
   end
   
   if @found_profile.ideal_mentor_interests.present?
     @percentage += 1
   end
   
   if @found_profile.ideal_mentor_role.present?
     @percentage += 1
   end
   
   if @found_profile.mentor_gender_preference.present?
     @percentage += 1
   end
   #57
   
      
   #Tab 7
   if (@found_profile.company_is_not_aware.present? && @found_profile.company_is_not_aware != "No") or
      (@found_profile.company_is_aware.present? && @found_profile.company_is_aware != "No") or
      (@found_profile.company_suggested.present? && @found_profile.company_suggested != "No") or
      (@found_profile.company_is_sponsor.present? && @found_profile.company_is_sponsor != "No") or
      (@found_profile.company_supports.present? && @found_profile.company_supports != "No") or
      (@found_profile.institutional_support_other.present? && @found_profile.institutional_support_other != "")
     @percentage += 1
   end
   #58
   
   
   #Tab 8
   if (@found_profile.heard_about_program_from_epwn.present? && @found_profile.heard_about_program_from_epwn != "No") or
      (@found_profile.heard_about_program_from_previous_participant.present? && @found_profile.heard_about_program_from_previous_participant != "No") or
      (@found_profile.heard_about_program_from_epwn_member.present? && @found_profile.heard_about_program_from_epwn_member != "No") or
      (@found_profile.heard_about_program_from_company.present? && @found_profile.heard_about_program_from_company != "No") or
      (@found_profile.heard_about_program_in_the_press.present? && @found_profile.heard_about_program_in_the_press != "No") or
      (@found_profile.heard_about_program_from_other_specified.present? && @found_profile.heard_about_program_from_other_specified != "")
     @percentage += 1
   end
   
   if @found_profile.mentee_fee_aware.present? && @found_profile.mentee_fee_aware != "No"
     @percentage += 1
   end
   #60
   
   
   @percentage = @percentage / 60 * 100
   
   @found_profile.update_attribute(:percentage, @percentage)

   @percentage
 end
   
end
