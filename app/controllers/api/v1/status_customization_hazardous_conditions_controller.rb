class Api::V1::StatusCustomizationHazardousConditionsController < Api::ApiController
  before_filter :ensure_user_allowed

  # GET /api/v1/status_customization_hazardous_conditions  
  def index
    render json: HazardousCondition.all.to_json
  end

  # GET /api/v1/status_customization_hazardous_conditions/1
  def show
    @status_customization_hazardous_condition = HazardousCondition.find(params[:id])
    render json: @status_customization_hazardous_condition
  end
  
end