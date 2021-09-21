Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
  }

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy"
  end

  root to: 'homes#top'
  get '/about' => 'homes#about', as: 'about'
  resources :posts do
    resources :post_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
    collection do
      get "search" => "posts#search", as: "search"
    end
  end
  resources :users, only: [:index, :show, :edit, :update, :destroy] do
    resource :relationships, only: [:create, :destroy]
    get "followings" => "relationships#followings", as: "followings"
    get "followers" => "relationships#followers", as: "followers"
  end
  get "users/withdraw/:id" => "users#withdraw", as: "users_withdraw"
  resources :chats, only: [:create]
  get "chat/:id" => "chats#show", as: "chat"
  resources :notifications, only: [:index]
end
