class Api::V1::StatusCustomizationHazardousConditionsController < Api::ApiController
  before_filter :ensure_user_allowed

  # GET /api/status_customization_hazardous_conditions
  def index
    render json: HazardousCondition.all.to_json
  end

  # GET /api/status_customization_hazardous_conditions/1
  def show
    if HazardousCondition.exists?(params[:id])
      @status_customization_hazardous_condition = HazardousCondition.find(params[:id])
      render json: @status_customization_hazardous_condition.to_json
    else
      render status: 404, json: '{"status":"failure"}'
    end
  end

end
