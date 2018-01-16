class Api::ApiController < ActionController::Base
  respond_to :json

  def get_datetime_formatted(datetime)    
    # Alternatively: return datetime.to_s    
    # YYYY-MM-DD HH:MM:SS.000Z
    return datetime.strftime("%Y-%m-%d %H:%M:%S.%LZ")
  end

  private

  def ensure_allowed
    authenticate_or_request_with_http_token do |token, options|
      @key = token
      @project = Project.where(api_key: token).first
      Project.exists?(api_key: token)
    end
  end

  def ensure_user_allowed    
    unless authenticate_or_request_with_http_token { |token, options| User.find_by(auth_token: token) }
      render json: { error: 'Token Error' }, status: 401
    end
  end

end
