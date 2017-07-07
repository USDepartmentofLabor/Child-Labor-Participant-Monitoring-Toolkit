class HouseholdTasksController < ApplicationController
  before_action :set_household_task, only: [:edit, :update, :destroy]

  def new
    @household_task = HouseholdTask.new
  end

  def create
    @household_task = HouseholdTask.new(household_task_params)
    @household_task.canonical_name = 'HT_' + @household_task.display_name.parameterize('_').upcase
    @household_task.save

    redirect_to status_config_project_path, notice: t("action_messages.create",
      model: HouseholdTask.model_name.human)
  end

  def edit
  end

  def update
    if @household_task.update(household_task_params)
      redirect_to status_config_project_path, notice: t("action_messages.update",
        model: HouseholdTask.model_name.human)
    else
      render :edit
    end
  end

  def destroy
    @household_task.destroy
    redirect_to status_config_project_path, notice: t("action_messages.destroy",
      model: HouseholdTask.model_name.human)
  end

  private

  def set_household_task
    @household_task = HouseholdTask.find(params[:id])
  end

  def household_task_params
    params.require(:household_task).permit(
      :code, :display_name
    )
  end
end
