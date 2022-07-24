class Admins::NotificationsController < Admins::AdminBaseController
  def index
    @name_page = 'All Notification Unreads'
    @notifications = Notification.notification_not_reads
  end

  def show
    @notification = Notification.find(params[:id])
    @notification.update(read: true) unless @notification.read?
    flash.clear
  end

  def all_notification_read
    @name_page = 'All Notification Reads'
    @notifications = Notification.notification_reads
  end
end