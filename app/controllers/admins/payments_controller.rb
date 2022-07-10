class Admins::PaymentsController < Admins::AdminBaseController
  include Modules::Crudable

  self.resource_action += %w[accept reject]

  def reject
    @payment.reject_payment(params)
    redirect_to admins_payment_path(@payment), notice: 'Reject payment berhasil!'
  end

  def accept
    @payment.accept_payment(params)
    redirect_to admins_payment_path(@payment), notice: 'Accept payment berhasil!'    
  end
end