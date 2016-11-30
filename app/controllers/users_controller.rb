class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    if stale?([@user.microposts, Commontator::Thread.find(34)])
      @microposts = @user.microposts.paginate(page: params[:page])
      p " NOOOOOOO CACHEEEEEENOOOOOOO CACHEEEEEENOOOOOOO CACHEEEEEENOOOOOOO CACHEEEEEENOOOOOOO CACHEEEEEENOOOOOOO CACHEEEEEENOOOOOOO CACHEEEEEENOOOOOOO CACHEEEEEENOOOOOOO CACHEEEEEENOOOOOOO CACHEEEEEENOOOOOOO CACHEEEEEENOOOOOOO CACHEEEEEENOOOOOOO CACHEEEEEENOOOOOOO CACHEEEEEENOOOOOOO CACHEEEEEENOOOOOOO CACHEEEEEE"
    else
      p "CACHEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE!EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE!EEEEEEE"
    end
    
  end
  
  def new
    if user_signed_in? then
      redirect_to current_user
    else redirect_to new_user_registration_path
    end
  end
  
  def index
    if params[:search]
      @users = User.search(params[:search]).order("created_at DESC")
    else
      @users = User.all.order('name ASC').paginate(page: params[:page])
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