class Api::V1::ServiceTypeCategoriesController < Api::ApiController
  before_filter :ensure_user_allowed

  # GET /api/v1/service_type_categories  
  def index
    render json: ServiceTypeCategory.all.to_json
  end

end