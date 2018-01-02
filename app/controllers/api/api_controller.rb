class Api::ApiController < ActionController::Base
  before_filter :ensure_allowed
  respond_to :json

  private

  def ensure_allowed
    authenticate_or_request_with_http_token do |token, options|
      @key = token
      @project = Project.where(api_key: token).first
      Project.exists?(api_key: token)
    end
  end
end
