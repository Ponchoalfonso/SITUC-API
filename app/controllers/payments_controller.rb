class PaymentsController < ApplicationController
  def create
    @payment = Payment.new(payment_params)
    user = User.find(@payment.user_id)

    if user&.credit >= @payment.amount
      if @payment.save
        user.credit = user.credit - @payment.amount
        user.save
        render :create
      else
        head(:unprocessable_entity)
      end
    else
      render json: {message: 'Not enough credit.'}, status: 403
    end
  end

  private
    def payment_params
      params.require(:payment).permit(:user_id, :bus_id, :amount)
    end
end
