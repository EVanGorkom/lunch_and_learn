class Api::V1::UsersController < ApplicationController
  def create
    if user_params[:password] == user_params[:password_confirmation]
      render json: UserSerializer.new(User.create!(user_params))
    else
      render json: { error: "Passwords do not match"}
    end
  end

  private 

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end