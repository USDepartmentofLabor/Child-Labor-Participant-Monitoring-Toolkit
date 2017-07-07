class IndustriesController < ApplicationController
  before_action :set_industry, only: [:edit, :update, :destroy]

  def new
    @industry = Industry.new
  end

  def create
    @industry = Industry.new(industry_params)
    @industry.canonical_name = 'I_' + @industry.display_name.parameterize('_').upcase
    @industry.save

    redirect_to status_config_project_path, notice: t("action_messages.create",
      model: Industry.model_name.human)
  end

  def edit
  end

  def update
    if @industry.update(industry_params)
      redirect_to status_config_project_path, notice: t("action_messages.update",
        model: Industry.model_name.human)
    else
      render :edit
    end
  end

  def destroy
    @industry.destroy
    redirect_to status_config_project_path, notice: t("action_messages.destroy",
      model: Industry.model_name.human)
  end

  private

  def set_industry
    @industry = Industry.find(params[:id])
  end

  def industry_params
    params.require(:industry).permit(
      :code, :display_name
    )
  end
end
