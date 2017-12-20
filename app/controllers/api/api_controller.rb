class Api::ApiController < ActionController::Base
  before_filter :ensure_allowed
  respond_to :json

  def ensure_allowed    
    unless authenticate_or_request_with_http_token { |token, options| User.find_by(auth_token: token) }
      render json: { error: 'Token Error' }, status: 401
    end
  end

end