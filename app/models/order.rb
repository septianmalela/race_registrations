class Order < ApplicationRecord
  belongs_to :user

  has_many :payments, dependent: :destroy
  has_many :order_items, dependent: :destroy

  enum status: [:success, :pending, :booking, :cancel], _suffix: true

  serialize :description, Hash

  after_save :generate_code

  def update_status_payment(order_item_member_contest)
    self.status        = 1 if payments.blank?
    self.total_payment = self.total_payment + order_item_member_contest.price
    self.save
  end

  def get_payment_user
    payments.confirmable_payments.map(&:payment).reject(&:blank?).sum
  end

  def generate_name_tag(code_number)
    # canvas = Magick::Image.from_blob(File.new(Rails.root.join('app/assets/images/blank_image.png')).read).first
    canvas = Magick::Image.new(600, 300)
    gc = Magick::Draw.new
    gc.pointsize(10)
    gc.text(10,10, code_number.center(1))

    gc.draw(canvas)
    canvas.write("#{code_number}.png")
  end

  def generate_code
    return if payments.confirmable_payments.blank?

    order_items.each do |order_item|
      member_contest = order_item.member_contest
      next if member_contest.code.present?

      list_contest        = member_contest.list_contest
      code_number         = list_contest.get_code
      member_contest.code = code_number
      member_contest.save

      generate_name_tag(code_number)
    end
  end
end
