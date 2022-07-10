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
end
