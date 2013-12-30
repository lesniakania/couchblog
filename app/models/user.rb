class User < Couchbase::Model
  attribute :email

  channels ['public']

  timestamps!

  view :all
  view :by_email

  def posts
    Post.by_user_id.key(self.id)
  end
end
