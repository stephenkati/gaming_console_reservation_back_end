class Api::V1::UsersController < ApplicationController
  def create
    @user= User.new(signup_params)
    if @user.save
      sign_in(@user)
      render json: @user, status: :created
    else
      render json: {errors: @user.errors.full_messages}
      status: :unprocessable_entity
  end

  def signup_params
      params.require(:user).permit(:name, :email, :password)
  end
end
