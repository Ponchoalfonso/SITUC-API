class PaymentsController < ApplicationController
  def create
    @payment = Payment.new(payment_params)
    
    if @payment.save
      render :create
    else
      head(:unprocessable_entity)
    end
  end

  private
    def payment_params
      params.require(:payment).permit(:user_id, :bus_id, :amount)
    end
end
