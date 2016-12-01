module MicropostsHelper
   def cache_key_for_post(micropost)
      "post-#{Commontator::Thread.find(micropost.id).comments.ids.count}"
   end
end
