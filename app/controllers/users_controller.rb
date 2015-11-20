class UsersController < ApplicationController
  before_action :set_project
  before_action :set_user, only: [:show, :edit, :update]

  def index
    if @project
      @users = @project.users
    else
      @users = User.all
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      notice = t("action_messages.update", model: User.model_name.human)
      if @project.nil?
        redirect_to @user, notice: notice
      else
        redirect_to project_user_path(@project, @user), notice: notice
      end
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :project_ids => [], :role_ids => [])
  end

  def set_user
    @user = User.find(params[:id])
  end

  def set_project
    @project = Project.find(params[:project_id]) unless params[:project_id].nil?
  end

end
