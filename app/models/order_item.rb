class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :member_contest
  belongs_to :inventory

  after_create :minus_quantity_inventory

  private

  def minus_quantity_inventory
    stock = inventory.stock
    inventory.stock = stock - quantity
    inventory.save

    order.update_status_payment(self)
  end
end
