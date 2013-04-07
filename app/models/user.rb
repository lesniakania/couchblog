class User < CouchRest::Model::Base
  property :email, String

  timestamps!

  collection_of :posts

  design do
    view :all
    view :by_email
  end
end
