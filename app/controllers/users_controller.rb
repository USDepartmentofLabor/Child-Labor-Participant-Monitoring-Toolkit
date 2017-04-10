class UsersController < ApplicationController
  before_action :do_authorize
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to new_user_path, notice: t("action_messages.create", model: User.model_name.human)
    else
      render :new
    end
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

  def destroy
    @user.destroy
    redirect_to users_path, notice: t("action_messages.destroy", model: User.model_name.human)
  end

  private
  def do_authorize
    authorize User
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :role_ids => [])
  end

  def set_user
    @user = User.find(params[:id])
  end
end
