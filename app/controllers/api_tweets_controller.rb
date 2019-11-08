class ApiTweetsController < ApplicationController
  before_action :set_user, only: [:create]
  def index
    @tweets = Tweet.all.order(created_at: :desc)

    render json: @tweets.as_json(include: {user: {only: :username}})
  end

  def create
    tweet = Tweet.new(tweet_params)
    tweet.user = @current_user
    if tweet.save!
      render json: {},status: :ok
    else
      message =  {error: tweet.errors.full_messages.to_sentence}
      render json: {}, status: :not_acceptable
    end
  end

  private
  def set_user
    @current_user = User.find_by_email(params[:email])
  end

  
  def tweet_params
    params.require(:tweet).permit(:body)
  end

end
