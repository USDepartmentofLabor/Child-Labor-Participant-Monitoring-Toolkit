class RolesController < ApplicationController
  before_action :do_authorize
  before_action :set_role, only: [:edit, :update]

  def index
    @roles = Role.all
  end

  def new
    @role = Role.new
  end

  def create
    @role = Role.new role_params

    if @role.save
      notice = t "action_messages.create", model: Role.model_name.human
      redirect_to roles_path, notice: notice
    else
      render :new
    end
  end

  def update
    if @role.update role_params
      notice = t "action_messages.update", model: Role.model_name.human
      redirect_to edit_role_path(@role), notice: notice
    else
      render :edit
    end
  end

  private
  def do_authorize
    authorize Role
  end

  def role_params
    params.require(:role).permit(:name, :ability_ids => [])
  end

  def set_role
    @role = Role.find(params[:id])
  end
end
