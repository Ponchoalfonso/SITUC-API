class UsersController < ApplicationController
  def create
    @user = User.new(user_params)

    if @user.save
      render :create
    else
      head(:unprocessable_entity)
    end
  end

  def payments
    user = User.where(authentication_token: params[:authentication_token]).first

    if user != nil
      @payments = user.payments

      if @payments.count > 0
        render :payments
      else
        head(:not_found)
      end
    else
      head(:unauthorized)
    end
  end

  private
    def user_params
      params.permit(:email, :password, :password_confirmation, :name, :last_name) 
    end
end
