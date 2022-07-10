class MemberContest < ApplicationRecord
  belongs_to :contest
  belongs_to :list_contest

  has_one :value_format, dependent: :destroy
  has_one :order_item, dependent: :destroy

  after_create :create_value_format, :create_order_item, :remaining_payment_user
  # :generate_code

  scope :order_desc, ->  { order(created_at: :desc) }
  scope :get_member_contest, ->(ids) { where(list_contest_id: ids) }

  private

  def create_value_format
    build_value_format.save if value_format.blank?
  end

  def create_order_item
    return if order_item.present?

    order_user = contest.user.order
    inventory  = list_contest.inventory
    build_order_item(order: order_user, inventory: inventory, price: inventory.price).save
  end

  def remaining_payment_user
    order = contest.user.order

    order.remaining_payment = get_remaining_payment
    order.save
  end

  def get_remaining_payment
    order = contest.user.order
    total_payment = order.total_payment
    return total_payment if order.payments.blank?

    payment_user = order.payments.map(&:payment).reject(&:blank?).sum
    total_payment - payment_user
  end
end
