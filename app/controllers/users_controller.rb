class UsersController < ApplicationController

before_action :authenticate_user!
respond_to :html, :pdf

def decide_new_or_edit
 if Profile.exists?(:user_id => current_user.id)
    @create_new_tag = false
    @profile = Profile.where(:user_id => current_user.id).take
 else
    @create_new_tag = true
 end
 @type = current_user.type
 @mentee = @type == 'Mentee'
end

def show
  @id = current_user.id
  @user = User.find(@id)
  decide_new_or_edit

end
def index
#    respond_to do |format|
#      format.html
#      format.pdf do
#        render :pdf => "users.pdf"
#     end
 #   end
end
end
