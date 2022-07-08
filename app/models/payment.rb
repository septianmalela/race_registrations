class Payment < ApplicationRecord
  belongs_to :order

  serialize :description, Hash
end
