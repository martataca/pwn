class HomeController < ApplicationController
	
    def backup
      @ls = `ls`
           
      `rsync -aplx --link-dest=pwn/public/uploads/profile/picture/ public/uploads/profile/picture/ tmp/merge/`
      `rsync -aplx --link-dest=pwn/public/uploads/profile/cv/ public/uploads/profile/cv/ tmp/merge/`      
      `zip -r backup.zip tmp/merge/`
      
      send_file "backup.zip", :type => 'application/zip', :disposition => 'attachment', :filename => "backup.zip"
      `rm -rf tmp/merge/`
    end


end
