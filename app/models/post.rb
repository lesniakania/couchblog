class Post < CouchRest::Model::Base
  property :title, String
  property :body, String

  timestamps!

  belongs_to :user

  design do
    view :all
    view :by_user_id_and__id
    view :by_user_id

    filter :for_user, "function(doc, req) {
      if(doc._deleted) {
        return true;
      }
      if (doc.type && ((doc.type == 'Post' && req.query.user_id == doc.user_id) || (doc.type == 'User' && doc['_id'] == req.query.user_id))) {
        return true;
      }
      return false;
    }"
  end
end
