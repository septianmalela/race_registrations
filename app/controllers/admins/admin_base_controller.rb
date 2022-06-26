class Admins::AdminBaseController < ApplicationController
  before_action :authenticate_admin!
  layout 'application_admin'
end