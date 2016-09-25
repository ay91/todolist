class API::V1::RegistrationController < API::V1::BaseController

  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: 200
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
