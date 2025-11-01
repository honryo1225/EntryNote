Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show] 
  get 'tweets/:tweet_id/likes' => 'likes#create'
  get 'tweets/:tweet_id/likes/:id' => 'likes#destroy'
  get 'tweets/about' => 'about_tweet'
  resources :tweets

  resources :tweets do
  resources :likes, only: [:create, :destroy]
  resources :comments, only: [:create]
  end
  
  root "tweets#index"
end
