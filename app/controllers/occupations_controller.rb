class OccupationsController < ApplicationController
  before_action :set_occupation, only: [:edit, :update, :destroy]

  def new
    @occupation = Occupation.new
  end

  def create
    @occupation = Occupation.new(occupation_params)
    @occupation.canonical_name = 'O_' + @occupation.display_name.parameterize('_').upcase
    @occupation.save

    redirect_to status_config_project_path, notice: t("action_messages.create",
      model: Occupation.model_name.human)
  end

  def edit
  end

  def update
    if @occupation.update(occupation_params)
      redirect_to status_config_project_path, notice: t("action_messages.update",
        model: Occupation.model_name.human)
    else
      render :edit
    end
  end

  def destroy
    @occupation.destroy
    redirect_to status_config_project_path, notice: t("action_messages.destroy",
      model: Occupation.model_name.human)
  end

  private

  def set_occupation
    @occupation = Occupation.find(params[:id])
  end

  def occupation_params
    params.require(:occupation).permit(
      :code, :display_name
    )
  end
end
