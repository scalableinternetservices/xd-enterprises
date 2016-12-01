module MicropostsHelper
   def cache_key_for_post(micropost)
      "post-#{micropost.id}-#{micropost.updated_at}-#{Commontator::Thread.find(micropost.id).comments.ids.count}"
      p  "post-#{micropost.id}-#{micropost.updated_at}-#{Commontator::Thread.find(micropost.id).comments.ids.count}"
   end
end
