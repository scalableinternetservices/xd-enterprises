class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end
  
  def new
    if user_signed_in? then
      redirect_to current_user
    else redirect_to new_user_registration_path
    end
  end
  
end
