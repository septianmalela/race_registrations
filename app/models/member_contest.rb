class MemberContest < ApplicationRecord
  belongs_to :contest
  belongs_to :list_contest

  has_one :value_format

  after_create :create_value_format

  scope :order_desc, ->  { order(created_at: :desc) }

  private

  def create_value_format
    build_value_format.save if value_format.blank?
  end
end
