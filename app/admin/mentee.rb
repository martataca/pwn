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
    column "Picture" do |mentee|
     image_tag mentee.profile.picture, class: 'profile_picture_thumbnail_xs'
    end
    column "First Name", :firstName
    column "Last Name",  :lastName
    column :email
    column "Phone Number" do |mentee|
      mentee.profile.phone_number
    end

    actions :defaults => false do |user|
      link_to "View", admin_profile_path(user)
    end
  end
 

end
