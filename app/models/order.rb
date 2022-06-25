class Order < ApplicationRecord
  belongs_to :user

  has_many :payments
  has_many :order_items

  enum status: [:success, :pending, :booking, :cancel]

  def update_status_payment(order_item_member_contest)
    self.status        = 1 if payments.blank?
    self.total_payment = self.total_payment + order_item_member_contest.price
    self.save
  end
end
