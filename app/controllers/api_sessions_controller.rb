class ApiSessionsController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }
  def create
    # User.where(email:params[:email]).first # return a collection
    user = User.find_by_email(params[:email]) # return the actual user

    # if user&.valid_password?(params[:password])
    if user && user.valid_password?(params[:password])
      render json: {message: 'user authenticated', username: user.username}, status: :ok
    else
      render json: {message: 'invalid password or email'}, status: :unauthorized
    end
  end
end
