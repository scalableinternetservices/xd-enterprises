class SearchController < ApplicationController
  def index
    
    @users = User.search(params[:search]).order("name ASC").paginate(page: params[:page])
    @hashtag = SimpleHashtag::Hashtag.find_by_name(params[:search])
    @hashtagged = @hashtag.hashtaggables.paginate(page: params[:page]) if @hashtag
    
  end
  
   
   
end
