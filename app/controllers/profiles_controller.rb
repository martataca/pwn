class ProfilesController < ApplicationController


 def new
  @profile = Profile.new
  @profile.user_id = current_user.id
 end

 def create
    @profile = Profile.new(profile_params)
    if @profile.save
     redirect_to @profile
    else
     render 'new'
    end
 end
 
 
  def edit
    
     @profile = Profile.find(user_id: params[:id])

  end
  
  def show
     @profile = Profile.find(params[:id])
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
     params.require(:profile).permit(:email, :skype_name, :phone_number)
  end

end
