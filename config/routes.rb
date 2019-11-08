Rails.application.routes.draw do
  devise_for :users

  root 'tweets#index'

  resources :tweets do
    collection do
      get 'user'
    end
  end

  resources :api_tweets
  
  resources :api_sessions, only: [:create]
end
