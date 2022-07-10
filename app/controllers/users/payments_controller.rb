class Users::PaymentsController < Users::BaseController
  include Modules::Crudable

  self.additional_parameters = [:avatar]

  before_action :authorize_payment
  before_action :set_total_payment_user, only: :index
  before_action :set_remaining_user, only: :index
  before_action :set_redirect_path, only: %i[create new edit update]
  before_action :set_status_payment, only: %i[create new edit update]

  def index
    super do
      @payments = current_user.order.payments.order(created_at: :desc)
    end
  end

  private

  def authorize_payment
    if current_user.contest.member_contests.blank?
      redirect_to users_contests_path, alert: 'Tidak bisa access halaman payment!!'
    end
  end

  def set_total_payment_user
    @total_payment_user = current_order.get_payment_user
  end

  def set_remaining_user
    @remaining_payment_user = current_order.remaining_payment
  end

  def set_redirect_path
    self.redirect_path = users_payments_path
  end

  def set_status_payment
    resource.status = Payment.statuses[:pending]
  end
end