module Couchbase
  class Model
    def self.timestamps!
      attribute :created_at, default: -> { Time.now }
      attribute :updated_at, default: -> { Time.now }
    end

    def self.channels(channels)
      attribute :channels, default: -> { channels }
    end
  end

  class View
    def key(key)
      self.params[:start_key] = key
      self.params[:end_key] = key
      self
    end
  end
end
