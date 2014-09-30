class UsersController < ApplicationController

before_action :authenticate_user!

def show
  @id = current_user.id
  @user = User.find(@id)
end

end
