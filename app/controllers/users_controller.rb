class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]

  def index
    @users = User.all
  end

  def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    if @user.update user_params
      notice = t("action_messages.update", model: User.model_name.human)
      redirect_to edit_user_path(@user), notice: notice
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :role_ids => [])
  end

  def set_user
    @user = User.find(params[:id])
  end
end
