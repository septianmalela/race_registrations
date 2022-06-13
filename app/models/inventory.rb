class Inventory < ApplicationRecord
  belongs_to :inventoryable, polymorphic: true

  validates :inventoryable_id, uniqueness: true
  validates :inventoryable_id, :stock, :price, presence: true
end
