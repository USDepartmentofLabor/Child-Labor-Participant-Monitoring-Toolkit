class Api::V1::StatusCustomizationWorkActivitiesController < Api::ApiController
  before_filter :ensure_user_allowed

  # GET /api/v1/status_customization_work_activities  
  def index
    render json: WorkActivity.all.to_json
  end

  # GET /api/v1/status_customization_work_activities/1
  def show
    @status_customization_work_activity = WorkActivity.find(params[:id])
    render json: @status_customization_work_activity
  end
  
end