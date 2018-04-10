class Api::V1::ServiceTypesController < Api::ApiController
  before_filter :ensure_user_allowed

  # GET /api/v1/service_types  
  def index
    render json: ServiceType.all.to_json
  end

end