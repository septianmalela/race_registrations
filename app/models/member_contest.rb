class MemberContest < ApplicationRecord
  belongs_to :contest
  belongs_to :list_contest

  has_one :value_format

  after_create :create_value_format, :generate_code

  scope :order_desc, ->  { order(created_at: :desc) }

  private

  def create_value_format
    build_value_format.save if value_format.blank?
  end

  def generate_code
    code_number = list_contest.get_code
    self.code = code_number
    self.save
  end
end
