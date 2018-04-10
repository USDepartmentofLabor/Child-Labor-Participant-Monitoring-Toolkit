class Api::V1::StatusCustomizationWorkActivitiesController < Api::ApiController
  before_filter :ensure_user_allowed

  # GET /api/status_customization_work_activities
  def index
    render json: WorkActivity.all.to_json
  end

  # GET /api/status_customization_work_activities/1
  def show
    if WorkActivity.exists?(params[:id])
      @status_customization_work_activity = WorkActivity.find(params[:id])
      render json: @status_customization_work_activity.to_json
    else
      render status: 404, json: '{"status":"failure"}'
    end

  end

end
