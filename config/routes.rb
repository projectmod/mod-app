Rails.application.routes.draw do

  # ==============================================================================================
  # Static Pages
  # ==============================================================================================
  root 'static_pages#landing'
  get 'about', to: 'static_pages#about'

  # ==============================================================================================
  # Rails Admin
  # ==============================================================================================
  mount RailsAdmin::Engine => '/superadmin', as: 'rails_admin'


  # ==============================================================================================
  # Resources
  # ==============================================================================================
  resources :password_resets

  resources :users, except: :show do
  	member do
      get :verify
      post :update_phone_no
  		post :activate
      get :success
  	end
  end

  namespace :dashboard do
    get 'account', to: 'account#index'
  end

  resources :user_sessions

  # ==============================================================================================
  # User Sessions/Login/Logout
  # ==============================================================================================
  get 'login', to: 'user_sessions#new', as: :login
  match 'logout', to: 'user_sessions#destroy', via: [:get, :delete]


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
    resource :outlets, except: :destroy
    resource :sessions, only: [:new, :create, :destroy]
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
  get 'success', to: 'payment_transactions#success'

end
