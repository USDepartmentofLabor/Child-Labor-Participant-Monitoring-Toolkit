class Api::V1::StatusCustomizationHouseholdTasksController < Api::ApiController

  # GET /api/v1/status_customization_household_tasks  
  def index
    render json: HouseholdTask.all.to_json
  end

  # GET /api/v1/status_customization_household_tasks/1
  def show
    @status_customization_household_task = HouseholdTask.find(params[:id])
    render json: @status_customization_household_task
  end
  
end