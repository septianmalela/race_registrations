class MemberContest < ApplicationRecord
  belongs_to :contest
  belongs_to :list_contest

  has_one :value_format, dependent: :destroy
  has_one :order_item, dependent: :destroy

  after_create :create_value_format, :create_order_item, :remaining_payment_user

  scope :order_desc, ->  { order(created_at: :desc) }
  scope :get_member_contest, ->(ids) { where(list_contest_id: ids) }

  def get_code
    number_code = list_contest.member_contests.map(&:code).reject(&:blank?)
    code_pmr = list_contest.code
    return "#{code_pmr}-001" if number_code.blank?

    number_code = number_code.map { |a| a.split('-') }.map(&:last).map(&:to_i).sort.last + 1

    number_code = if number_code < 10
                    "00#{number_code}"
                  elsif number_code >= 10 && number_code <= 99
                    "0#{number_code}"
                  elsif number_code >= 100
                    "#{number_code}"
                  end

    "#{code_pmr}-#{number_code}"
  end

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
    order.status = Order.statuses[:pending]
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
