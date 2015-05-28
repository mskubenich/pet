Rails.application.routes.draw do

  root to: 'pages#index'

  namespace :admin do
    get '/', to: 'pages#index'
    resources :users, only: [:index]
  end

  resources :pages, only: [:index]

  resources :users, only: [:create] do
    collection do
      get :profile
      post :email_available
      post :avatar
    end
  end

  resources :sessions, only: [:create] do
    collection do
      get :current_user_info
      delete :destroy
    end
  end
end