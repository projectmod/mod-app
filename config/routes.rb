Rails.application.routes.draw do

  # ==============================================================================================
  # Static Pages
  # ==============================================================================================
  root 'static_pages#landing'
  get :about, to: 'static_pages#about'
  get :how_it_works, to: 'static_pages#how_it_works'
  get :faq, to: 'static_pages#faq'
  get :terms, to: 'static_pages#terms'

  # ==============================================================================================
  # Rails Admin
  # ==============================================================================================
  mount RailsAdmin::Engine => '/superadmin', as: 'rails_admin'
  get :admin_portal, to: 'admin_sessions#new'
  post :admin_login, to: 'admin_sessions#create'

  # ==============================================================================================
  # Password Reset
  # ==============================================================================================
  resources :password_resets, only: [:new, :create, :edit, :update]

  # ==============================================================================================
  # Users
  # ==============================================================================================
  resources :users, except: [:index,:show, :destroy] do
  	member do
      get :verify
      post :update_phone_no
  		post :activate
      get :success
  	end
  end

  namespace :dashboard do
    get :account, to: 'account#index'
  end

  # ==============================================================================================
  # User Sessions/Login/Logout
  # ==============================================================================================
  resources :user_sessions, only: :create
  get :login, to: 'user_sessions#new'
  match :logout, to: 'user_sessions#destroy', via: [:get, :delete]

  # ==============================================================================================
  # Sorcery/Omniauth
  # ==============================================================================================
  post "oauth/callback", to: "oauth#callback"
  get "oauth/callback", to: "oauth#callback"
  get "oauth/:provider", to: "oauth#oauth", as: :auth_at_provider

  # ==============================================================================================
  # Outlets
  # ==============================================================================================
  resources :outlets, only: [:index, :show]

  # ==============================================================================================
  # Merchants
  # ==============================================================================================

  namespace :merchants do
    resources :users, except: [:index, :show, :destroy]

    # Outlets
    resources :outlets, except: :destroy do
      get :customize, to: 'outlets#customize'
      get :photos, to: 'outlets#photos'
      post :upload_photos, to: 'outlets#upload_photos'
      resources :steps, only: [:show, :update]
    end

    # Payments
    resources :payment_transactions, only: :create do
      member do
        get :success, to: 'payment_transactions#success'
        get :failure, to: 'payment_transactions#failure'
      end
    end
    resources :pricings, only: [:index, :create]

    # Dashboard
    get :dashboard, to: 'dashboard#index'
    get :success, to: 'static_pages#success'

    # Sessions
    resources :sessions, only: [:new, :create, :destroy]

    # Confirm Booking
    resources :bookings, except: [:new, :create, :update, :edit, :destroy] do
      member do
        get :confirm
        get :success
        get :failure
      end
    end
  end

  # ==============================================================================================
  # Bookings
  # ==============================================================================================
  resources :bookings, only: :create do
    member do
      get :outlet_confirmed
      post :user_cancellation
      get :user_cancellation_confirmation
      get :result
      get :pending
    end
  end

  # ==============================================================================================
  # Resque
  # ==============================================================================================
  mount Resque::Server, at: "/resque"

end
