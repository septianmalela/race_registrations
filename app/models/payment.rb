class Payment < ApplicationRecord
  include ImageUploader::Attachment(:avatar)

  belongs_to :order

  enum status: [:success, :pending, :reject], _suffix: true

  scope :confirmable_payments, -> { where(confirmable: true) }

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
    remaining_payment = order.total_payment - order.payments.confirmable_payments.map(&:payment).sum
    order.remaining_payment = remaining_payment
    order.save
  end
end
