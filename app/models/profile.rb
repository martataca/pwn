class Profile < ActiveRecord::Base
   belongs_to :user
   mount_uploader :picture, PictureUploader
   mount_uploader :cv, ResumeUploader
   
 def application_percentage(id)
   # Profile.find(id)[:linkedin_profile].present?
   @percentage = 0.0
   if Profile.find(id)[:fullName].present?
     @percentage += 1
   end
   if Profile.find(id)[:email].present?
     @percentage += 1
   end
   if Profile.find(id)[:phone_number].present?
     @percentage += 1
   end
   if Profile.find(id)[:skype_name].present?
     @percentage += 1
   end
   if Profile.find(id)[:linkedin_profile].present?
     @percentage += 1
   end
   if Profile.find(id)[:picture].present?
     @percentage += 1
   end
   if Profile.find(id)[:cv].present?
     @percentage += 1
   end
   
   @percentage / 7 * 100

 end
   
end
