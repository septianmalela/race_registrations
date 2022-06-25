class Contest < ApplicationRecord
  belongs_to :user

  has_many :member_contests

  accepts_nested_attributes_for :member_contests, allow_destroy: true, reject_if: :all_blank
end
