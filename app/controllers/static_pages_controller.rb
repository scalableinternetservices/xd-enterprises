class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      @micropost  = current_user.microposts.build
      if stale? ([current_user.feed, Commontator::Thread.find(current_user.feed.ids)])
        #p "HELLLLAALALALALLALLALLLLALALA"
        @feed_items = current_user.feed.paginate(page: params[:page])
      else
        #p "CACHED AS FUCK!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
      end
    end
  end
  
  
end
