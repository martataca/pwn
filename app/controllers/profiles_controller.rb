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
     params.require(:profile).permit(:firstName, :picture, :cv, :email, :skype_name, :phone_number, :marital_status, :born_on, :number_children, :city, :country_origin, :country_residence)
  end

end
