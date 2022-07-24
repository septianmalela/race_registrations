class Notification < ApplicationRecord
  belongs_to :notificationable, polymorphic: true

  scope :notification_not_reads, -> { where(read: false) }
  scope :notification_reads, -> { where(read: true) }
end
