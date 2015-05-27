Rails.application.routes.draw do
  get 'sessions/create'

  get 'sessions/destroy'

  get 'users/create'

  root to: 'pages#index'
  resources :pages, only: [:index]

  resources :users, only: [:create] do
    collection do
      get :profile
      post :email_available
    end
  end

  resources :sessions, only: [:create] do
    collection do
      get :current_user_info
      delete :destroy
    end
  end

  get '/admin', to: 'admin/pages#index'
end