class SearchController < ApplicationController
  def index
    
    @users = User.search(params[:search]).order("created_at DESC")
    @hashtag = SimpleHashtag::Hashtag.find_by_name(params[:search])
    @hashtagged = @hashtag.hashtaggables if @hashtag
    
  end
end
