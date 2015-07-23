Rails.application.routes.draw do

  scope "(:locale)", locale: /en|ru/ do

    root to: 'pages#index'

    namespace :admin do
      get '/', to: 'pages#index'
      resources :users, only: [:index, :destroy, :update, :show] do
        member do
          post :ban
          post :unban
        end
      end
      resources :news, only: [:index, :create, :update, :destroy, :show]
      get 'static_pages/:name', to: 'static_pages#show', constraints: { name: /#{ StaticPage::NAMES.join('|')}/ }
      put 'static_pages/:name', to: 'static_pages#update', constraints: { name: /#{ StaticPage::NAMES.join('|')}/ }
      resources :copulations, except: [:new, :edit] do
        member do
          post :approve
          post :reject
        end
      end
      resources :sales, except: [:new, :edit] do
        member do
          post :approve
          post :reject
        end
      end
      resources :products, except: [:new, :edit] do
        collection do
          get :shop_categories
          get :shop_subcategories
        end
      end
      resources :good_hands, except: [:new, :edit] do
        member do
          post :approve
          post :reject
        end
      end
      resources :categories, only: [:index, :create, :update, :destroy, :show] do
        collection do
          get :titles
        end
      end
      resources :shop_categories, only: [:index, :create, :update, :destroy, :show] do
        resources :shop_subcategories, only: [:index, :create, :update, :destroy, :show]
      end
      resources :breeds, only: [:index, :create, :update, :destroy, :show] do
        collection do
          get :all
        end
      end
      resources :slides, only: [:index, :show, :create, :destroy]
      resources :copulation_slides, only: [:index, :show, :create, :destroy]
      resources :orders, only: [:index, :show, :destroy]
    end

    resources :pages, only: [:index] do
      collection do
        get :slides
        get :sale_slides
        get :copulation_slides
        get :the_copulation_slides
        get :shop_slides
        get :main_slides
      end
    end

    resources :attachments, only: [] do
      collection do
        post '/:entity_type', to: 'attachments#create'
      end
    end

    resources :users, only: [:create, :index, :show] do
      collection do
        get :profile
        get :my_info
        put :update_profile
        post :email_available
        post :avatar
        get :friends
        get :requested_friends
        get :pending_friends
        get :friends_preview
      end
    end

    resources :sessions, only: [:create] do
      collection do
        get :current_user_info
        delete :destroy
      end
    end

    resources :news, only: [:index, :show] do
      collection do
        get :categories
        get :popular
      end
    end
    resources :copulations, only: [:index, :create, :update, :show] do
      member do
        get :show_phone
      end
    end

    resources :sales, only: [:index, :create, :update, :show] do
      member do
        get :show_phone
      end
    end

    resources :products, only: [:index, :show]

    resources :good_hands, only: [:index, :create, :update, :show] do
      member do
        get :show_phone
      end
    end

    resources :comments, only: [:index, :create]
    resources :notes, only: [:create, :show]
    resources :breeds, only: [:index]
    resources :shop_categories, only: [:index]

    resources :cart, only: [:index, :destroy] do
      collection do
        post :add
        post :set_count
      end
    end

    resources :order, only: [:create]
    resources :posts, only: [:index, :show, :create, :update, :destroy]

    resources :friendship, only: [] do
      member do
        post :create
        post :accept
        post :decline
        post :cancel
        post :delete
      end
    end

    resources :messages, only: [:index, :create, :show]
    resources :my_pets, only: [:index, :create, :update, :show, :destroy]

    get '/auth/:service/callback' => 'services#create'
    post '/auth/:service/callback' => 'services#create'
    get '/auth/failure' => 'services#failure'
    resources :services, :only => [:create]
  end

  get '/:locale' => 'pages#index'
end