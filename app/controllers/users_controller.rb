class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    if stale?([@user.microposts, Commontator::Thread.find(@user.microposts.ids)])
      @microposts = @user.microposts.paginate(page: params[:page])
    end
    
  end
  
  def new
    if user_signed_in? then
      redirect_to current_user
    else redirect_to new_user_registration_path
    end
  end
  
  def index
      @users = User.all.order('name ASC').paginate(page: params[:page])
  end
  
  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end
  
end