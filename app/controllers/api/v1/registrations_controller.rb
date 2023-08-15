class Api::V1::RegistrationsController < Devise::RegistrationsController
  def create
    @user = User.new(signup_params)
    if @user.save
      sign_in(@user)
      render json: @user, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def signup_params
    params.require(:user).permit(:username, :email, :password)
  end
end
