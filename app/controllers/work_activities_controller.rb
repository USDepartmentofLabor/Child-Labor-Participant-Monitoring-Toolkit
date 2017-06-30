class WorkActivitiesController < ApplicationController
  before_action :set_work_activity, only: [:edit, :update, :destroy]

  def new
    @work_activity = WorkActivity.new
  end

  def create
    @work_activity = WorkActivity.new(work_activity_params)
    @work_activity.canonical_name = 'WA_' + @work_activity.display_name.parameterize('_').upcase
    @work_activity.save

    redirect_to status_config_project_path, notice: t("action_messages.create",
      model: WorkActivity.model_name.human)
  end

  def edit
  end

  def update
    if @work_activity.update(work_activity_params)
      redirect_to status_config_project_path, notice: t("action_messages.update",
        model: WorkActivity.model_name.human)
    else
      render :edit
    end
  end

  def destroy
    @work_activity.destroy
    redirect_to status_config_project_path, notice: t("action_messages.destroy",
      model: WorkActivity.model_name.human)
  end

  private

  def set_work_activity
    @work_activity = WorkActivity.find(params[:id])
  end

  def work_activity_params
    params.require(:work_activity).permit(
      :code, :display_name
    )
  end
end
