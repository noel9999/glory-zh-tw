class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(permitted_params.user_attrs)
    end

    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(permitted_params.user_attrs)
    end
  end

  private

  def permitted_params
    @permitted_params ||= PermittedParams.new(params, current_user)
  end
  helper_method :permitted_params

  def after_sign_out_path_for(resource_or_scope)
    admin_root_path
  end  


end
