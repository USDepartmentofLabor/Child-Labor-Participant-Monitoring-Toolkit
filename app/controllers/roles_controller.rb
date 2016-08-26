class RolesController < ApplicationController
  before_action :set_role, only: [:edit, :update]

  def index
    @roles = Role.all
  end

  def update
    if @role.update role_params
      notice = t("action_messages.update", model: Role.model_name.human)
      redirect_to edit_role_path(@role), notice: notice
    else
      render :edit
    end
  end

  private

  def role_params
    params.require(:role).permit(:name, :abilities => [])
  end

  def set_role
    @role = Role.find(params[:id])
  end
end
