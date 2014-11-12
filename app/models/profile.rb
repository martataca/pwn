class Profile < ActiveRecord::Base
   belongs_to :user
   mount_uploader :picture, PictureUploader
   mount_uploader :cv, ResumeUploader
   mount_uploader :app_pdf, ProfileUploader

   
end
