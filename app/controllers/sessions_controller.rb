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
end
