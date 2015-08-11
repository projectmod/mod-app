Rails.application.routes.draw do

  # ==============================================================================================
  # Static Pages
  # ==============================================================================================
  root 'static_pages#landing'
  get :about, to: 'static_pages#about'

  # ==============================================================================================
  # Rails Admin
  # ==============================================================================================
  mount RailsAdmin::Engine => '/superadmin', as: 'rails_admin'

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
    resources :outlets, except: :destroy do
      get :customize, to: 'outlets#customize'
      get :photos, to: 'outlets#photos'
      resources :steps, only: [:show, :update]
    end

    get :dashboard, to: 'dashboard#index'
    get :success, to: 'static_pages#success'
    resources :sessions, only: [:new, :create, :destroy]
    resources :users, except: [:index, :show, :destroy]
  end

  # ==============================================================================================
  # Bookings
  # ==============================================================================================
  resources :bookings do
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

  # ==============================================================================================
  # Payment
  # ==============================================================================================
  resources :payment_transactions, only: [:new, :create]
  get :success, to: 'payment_transactions#success'

end
