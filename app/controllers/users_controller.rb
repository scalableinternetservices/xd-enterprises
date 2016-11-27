class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
    
    if params[:search]
      @posts = User.search(params[:search]).order("created_at DESC")
    else
      @posts = User.all.order('created_at DESC')
  end
  
  def new
    if user_signed_in? then
      redirect_to current_user
    else redirect_to new_user_registration_path
    end
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
