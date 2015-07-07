Rails.application.routes.draw do

  # ==============================================================================================
  # Static Pages
  # ==============================================================================================
  root 'static_pages#landing'


  # ==============================================================================================
  # Rails Admin
  # ==============================================================================================
  mount RailsAdmin::Engine => '/superadmin', as: 'rails_admin'


  # ==============================================================================================
  # Resources
  # ==============================================================================================
  resources :password_resets

  resources :users do
  	member do
  		get :activate
  	end
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

  resources :outlets

end
