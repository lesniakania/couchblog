class Api::ApiController < ActionController::Base
  def authenticate
    authenticate_or_request_with_http_basic do |email, password|
      @current_user = User.by_email.key(email).first
    end
  end
end
