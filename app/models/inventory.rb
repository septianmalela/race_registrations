class Inventory < ApplicationRecord
  belongs_to :inventoryable, polymorphic: true

  validates :inventoryable_id, uniqueness: true
  validates :inventoryable_id, :stock, :price, presence: true

  has_many :order_items

  def remaining_stock
    sold_quantity ? stock - sold_quantity : stock
  end

  def total_price_sold_quantity
    sold_quantity ? sold_quantity * price : price
  end
end
