class Payment < ApplicationRecord
  include ImageUploader::Attachment(:avatar)

  belongs_to :order

  has_many :notifications, as: :notificationable, dependent: :destroy

  enum status: [:success, :pending, :reject], _suffix: true

  scope :confirmable_payments, -> { where(confirmable: true) }
  scope :not_confirm_payments, -> { where(confirmable: false) }

  after_create :create_notifications

  def reject_payment(params)
    self.reason = params[:reason]
    self.status = Payment.statuses[:reject]
    self.save
  end

  def accept_payment(params)
    self.reason = nil
    self.status = Payment.statuses[:success]
    self.confirmable = true
    self.save

    calculate_remaining_payments
  end

  def calculate_remaining_payments
    payment_order if order.payments.confirmable_payments.present?
  end

  def payment_order
    calculate_total_payments = order.payments.confirmable_payments.map(&:payment).sum
    remaining_payment = order.total_payment - calculate_total_payments
    order.remaining_payment = remaining_payment
    order.status = Order.statuses[:success] if order.remaining_payment <= 0
    order.save
  end

  def create_notifications
    url = "#{default_url}/admins/payments/#{id}"
    information_notification = 'Ada Pembayaran Baru!'
    notification = notifications.new(information: information_notification, url_path: url)
    notification.save
  end
end
