class HomeController < ApplicationController
	
    def backup
    if current_admin_user.present?
      %x(rm -f backup.zip)
      %x(mkdir tmp/merge/)
      
      @profiles = Profile.order(:id)
      
      @profiles.each do |profile|
        if profile.submitted
          id = profile.id.to_s
          
          cmd = 'mkdir tmp/merge/' + id + '/' 
          %x<#{cmd}>
          
		merge = 'tmp/merge/' + id + '/'
          cmd = 'cp public/uploads/profile/' + id + '.pdf ' + merge
          %x<#{cmd}>
          
          link_dest = 'pwn/public/uploads/profile/picture/' + id + '/'
          target = 'public/uploads/profile/picture/' + id + '/'
          merge = 'tmp/merge/' + id + '/'
          cmd = 'rsync -aplx --link-dest=' + link_dest + ' ' + target + ' ' + merge
          %x<#{cmd}>
          
          link_dest = 'pwn/public/uploads/profile/cv/' + id + '/'
          target = 'public/uploads/profile/cv/' + id + '/'
          merge = 'tmp/merge/' + id + '/'
          cmd = 'rsync -aplx --link-dest=' + link_dest + ' ' + target + ' ' + merge
          %x<#{cmd}>         
          
          fullName = profile.firstName + " " + profile.surnames + " " + id
          existing_folders = %x(find tmp/merge)
          
          if fullName.length < 150
            fullName = fullName.tr(" ", "_")
            cmd = 'mv tmp/merge/' + id + '/ tmp/merge/' + fullName + '/'
            %x<#{cmd}>
          end
          
        end
      end
      
      %x(zip -r backup.zip tmp/merge/)     
      send_file "backup.zip", :type => 'application/zip', :disposition => 'attachment', :filename => "backup.zip"
      %x(rm -rf tmp/merge/)
      
    else
    	redirect_to root_url
    end
end



end
