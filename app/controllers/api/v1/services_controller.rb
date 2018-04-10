class Api::V1::ServicesController < Api::ApiController
  before_filter :ensure_user_allowed

  # GET /api/v1/services  
  def index
    render json: Service.all.to_json
  end

end