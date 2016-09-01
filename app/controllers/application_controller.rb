class ApplicationController < ActionController::Base
  include Pundit

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def after_sign_in_path_for(resource)
    '/'
  end

private

  def user_not_authorized
    flash[:alert] = t "general.not_authorized"
    redirect_to(request.referrer || root_path)
  end
end
