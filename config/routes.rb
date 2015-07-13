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
  		get :activate
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
  resources :outlets
  resources :bookings do
    member do
        get :pending
        get :outlet_confirmed
        get :user_confirmed
      end
  end
end
