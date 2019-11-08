class ApiUsersController < ApplicationController
  def create
    user = User.find_by_email(params[:email])

    if user && user.valid_password?(params[:password])
      render json: user.as_json(only: [:username, :email]), status: :ok
    else
      render json: {body: 'invalid email or password'}, status: :unauthorized
    end
  end

end
