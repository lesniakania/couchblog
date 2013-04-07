Rails.application.eager_load!

CouchRest::Model::Base.descendants.each do |model|
  if model.respond_to?(:design_doc)
    model.design_doc.sync
  end
end
