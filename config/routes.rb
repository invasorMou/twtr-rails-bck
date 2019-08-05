Rails.application.routes.draw do
  devise_for :users
  root 'tweets#index'
  resources :tweets do
    collection do
      get 'user_tweets'
    end
  end
end
