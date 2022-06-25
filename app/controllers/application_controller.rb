class ApplicationController < ActionController::Base
  include ApplicationHelper

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update) {
      |u| u.permit(:password, :current_password, :email,
                   profile_attributes: [:id, :name, :phone])
    }

    devise_parameter_sanitizer.permit(:sign_up) {
      |u| u.permit(:password, :current_password, :email,
                   profile_attributes: [:id, :school, :name, :phone, :type_pmr])
    }
  end
end
