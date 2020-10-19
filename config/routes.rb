Rails.application.routes.draw do
  resources :posts
  root to: "application#home"
  get :index, to: "application#index"
  resources :users

  namespace :api do
    resources :users, only: [:index, :show, :create, :update, :destroy]
  end
end
