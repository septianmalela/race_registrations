class Admins::AdminBaseController < ApplicationController
  before_action :authenticate_admin!
  layout 'application_admin'

  before_action :set_notifications

  def set_notifications
    @notifications       = Notification.notification_not_reads.limit(3)
    @total_notifications = @notifications.count
    flash[:notice]       = "You have #{@notifications.count} unread notifications" if @notifications.present?
  end
end