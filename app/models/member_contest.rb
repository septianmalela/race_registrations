class MemberContest < ApplicationRecord
  belongs_to :contest
  belongs_to :list_contest

  has_one :value_format, dependent: :destroy
  has_one :order_item, dependent: :destroy

  after_create :create_value_format, :generate_code, :create_order_item

  scope :order_desc, ->  { order(created_at: :desc) }
  scope :get_member_contest, ->(ids) { where(list_contest_id: ids) }

  private

  def create_value_format
    build_value_format.save if value_format.blank?
  end

  def generate_code
    code_number = list_contest.get_code
    self.code = code_number
    self.save
  end

  def create_order_item
    return if order_item.present?

    order_user = contest.user.order
    inventory  = list_contest.inventory
    build_order_item(order: order_user, inventory: inventory, price: inventory.price).save
  end
end
