class RegistrationsController < Devise::RegistrationsController

  before_action :configure_permitted_parameters, only: [:create]

  protected

  def after_sign_up_path_for(resource)
    '/dashboard'
  end

  # The path used after sign up for inactive accounts. You need to overwrite
  # this method in your own RegistrationsController.
  def after_inactive_sign_up_path_for(resource)
    '/dashboard'
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:name)
  end
end