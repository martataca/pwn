class UsersController < ApplicationController

before_action :authenticate_user!

def decide_new_or_edit
 if Profile.exists?(:user_id => current_user.id)
    @app_tag = false
 else
    @app_tag = true
 end
end

def show
  @id = current_user.id
  @user = User.find(@id)
  decide_new_or_edit
end




def index
end
end
