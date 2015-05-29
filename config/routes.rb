Rails.application.routes.draw do

  root to: 'pages#index'

  namespace :admin do
    get '/', to: 'pages#index'
    resources :users, only: [:index]
    resources :news, only: [:index, :create, :update, :destroy] do
      scope do
        post :upload_preview_image
      end
    end
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