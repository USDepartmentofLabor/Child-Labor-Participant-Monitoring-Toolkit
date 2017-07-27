class AbusesController < ApplicationController
  before_action :set_abuse, only: [:edit, :update, :destroy]

  def new
    @abuse = Abuse.new
  end

  def create
    @abuse = Abuse.new(abuse_params)
    @abuse.canonical_name = @abuse.display_name.parameterize('_').upcase
    @abuse.save

    redirect_to status_config_project_path, notice: t("action_messages.create",
      model: Abuse.model_name.human)
  end

  def edit
  end

  def update
    if @abuse.update(abuse_params)
      redirect_to status_config_project_path, notice: t("action_messages.update",
        model: Abuse.model_name.human)
    else
      render :edit
    end
  end

  def destroy
    @abuse.destroy
    redirect_to status_config_project_path, notice: t("action_messages.destroy",
      model: Abuse.model_name.human)
  end

  private

  def set_abuse
    @abuse = Abuse.find(params[:id])
  end

  def abuse_params
    params.require(:abuse).permit(
      :code, :display_name
    )
  end
end
