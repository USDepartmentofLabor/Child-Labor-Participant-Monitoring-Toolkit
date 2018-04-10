class Api::V1::StatusCustomizationHouseholdTasksController < Api::ApiController
  before_filter :ensure_user_allowed

  # GET /api/status_customization_household_tasks
  def index
    render json: HouseholdTask.all.to_json
  end

  # GET /api/status_customization_household_tasks/1
  def show
    if HouseholdTask.exists?(params[:id])
      @status_customization_household_task = HouseholdTask.find(params[:id])
      render json: @status_customization_household_task.to_json
    else
      render status: 404, json: '{"status":"failure"}'
    end

  end

end
