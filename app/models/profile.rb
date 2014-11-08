class Profile < ActiveRecord::Base
   belongs_to :user
   mount_uploader :picture, PictureUploader
   mount_uploader :cv, ResumeUploader
  

   
end
