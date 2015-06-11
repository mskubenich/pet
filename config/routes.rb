Rails.application.routes.draw do

  scope "(:locale)", locale: /en|ru/ do

    root to: 'pages#index'

    namespace :admin do
      get '/', to: 'pages#index'
      resources :users, only: [:index]
      resources :news, only: [:index, :create, :update, :destroy, :show]
      get 'static_pages/:name', to: 'static_pages#show', constraints: { name: /#{ StaticPage::NAMES.join('|')}/ }
      put 'static_pages/:name', to: 'static_pages#update', constraints: { name: /#{ StaticPage::NAMES.join('|')}/ }
      resources :copulations, except: [:new, :edit]
      resources :sales, except: [:new, :edit]
    end

    resources :pages, only: [:index] do
      collection do
        get :slides
      end
    end

    resources :attachments, only: [] do
      collection do
        post '/:entity_type', to: 'attachments#create'
      end
    end

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

    resources :news, only: [:index, :show]
    resources :copulations, only: [:index, :create, :update, :show]
    resources :sales, only: [:index, :create, :update, :show]

  end

  get '/:locale' => 'pages#index'
end