class Post < Couchbase::Model
  attribute :title
  attribute :body
  attribute :user_id

  channels ['public']

  timestamps!

  view :all
  view :by_user_id

  def user=(user)
    self.user_id = user.id
  end
end
