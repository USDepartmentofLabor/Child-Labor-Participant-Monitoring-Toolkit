class HazardousConditionsController < ApplicationController
  before_action :set_hazardous_condition, only: [:edit, :update, :destroy]

  def new
    @hazardous_condition = HazardousCondition.new
  end

  def create
    @hazardous_condition = HazardousCondition.new(hazardous_condition_params)
    @hazardous_condition.canonical_name = 'O_' + @hazardous_condition.display_name.parameterize('_').upcase
    @hazardous_condition.save

    redirect_to status_config_project_path, notice: t("action_messages.create",
      model: HazardousCondition.model_name.human)
  end

  def edit
  end

  def update
    if @hazardous_condition.update(hazardous_condition_params)
      redirect_to status_config_project_path, notice: t("action_messages.update",
        model: HazardousCondition.model_name.human)
    else
      render :edit
    end
  end

  def destroy
    @hazardous_condition.destroy
    redirect_to status_config_project_path, notice: t("action_messages.destroy",
      model: HazardousCondition.model_name.human)
  end

  private

  def set_hazardous_condition
    @hazardous_condition = HazardousCondition.find(params[:id])
  end

  def hazardous_condition_params
    params.require(:hazardous_condition).permit(
      :code, :display_name
    )
  end
end
