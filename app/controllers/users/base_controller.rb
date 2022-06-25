class Users::BaseController < ApplicationController
  before_action :authenticate_user!
  layout 'application_user'

  def current_profile
    current_user.profile
  end
end