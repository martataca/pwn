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

#filter :select1, :label => 'Selection 1', :as  => :select


end
