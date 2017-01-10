class ApplicationController < ActionController::Base
  include Pundit
  before_action :set_locale

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

  def set_locale
    accept_language = request.env['HTTP_ACCEPT_LANGUAGE']

    logger.debug "* Accept-Language: #{accept_language}"
    I18n.locale = extract_locale_from accept_language
    logger.debug "* Locale set to '#{I18n.locale}'"
  end

  def extract_locale_from str
    return if str.nil?
    str.scan(/^[a-z]{2}/).first
  end
end
