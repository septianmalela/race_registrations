class Contest < ApplicationRecord
  belongs_to :user

  has_many :member_contests
end
