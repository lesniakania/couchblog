class Api::UsersController < Api::ApiController

  before_filter :authenticate

  def show
    if @current_user
      render :json => @current_user
    else
      render :json => {}, :status => :not_found
    end
  end

end
