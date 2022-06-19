class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :member_contests
  belongs_to :inventory
end
