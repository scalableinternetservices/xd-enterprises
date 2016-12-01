module SearchHelper
   
   def cache_key_for_user_list
      "user-list-#{params[:search]}-#{@users.maximum(:updated_at)}-#{@users.count}"
      p "user-list-#{params[:search]}-#{@users.maximum(:updated_at)}-#{@users.count}"
   end
   
   def cache_key_for_tags
      "#{params[:search]}-tag-#{@hashtag.updated_at}-#{@hashtagged.count}"
      p "#{params[:search]}-tag-#{@hashtag.updated_at}-#{@hashtagged.count}"
   end
end
