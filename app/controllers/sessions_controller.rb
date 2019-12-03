class SessionsController < ApplicationController
  def create
    @user = User.where(email: params[:email]).first

    if @user.valid_password?(params[:password])
      render :create, status: :created
    else
      head(:unauthorized)
    end
  end

  def current_user
    @user = User.where(authentication_token: params[:authentication_token]).first

    if @user != nil
      render :current_user
    else
      head(:unauthorized)
    end
  end

  def charge_credit
    @user = User.where(authentication_token: params[:authentication_token]).first

    if @user != nil
      amount = params[:amount].to_f
      @user.credit += amount
      @user.save
      render json: { credit: @user.credit }, status: 200
    else
      head(:unauthorized)
    end
  end

end
