class User < CouchRest::Model::Base
  property :email, String

  timestamps!

  collection_of :posts

  design do
    view :all
    view :by_email
  end

  def posts
    Post.by_user_id.key(self.id)
  end
end
