Rails.application.routes.draw do
  get 'password_resets/create'

  get 'password_resets/edit'

  get 'password_resets/update'

  root 'static_pages#landing'

  resources :users do
  	member do
  		get :activate
  	end
  end

  resources :user_sessions
  resources :password_resets

  get 'login', to: 'user_sessions#new', as: :login
	post 'logout', to: 'user_sessions#destroy', as: :logout

  post "oauth/callback", to: "oauth#callback"
  get "oauth/callback", to: "oauth#callback"
  get "oauth/:provider", to: "oauth#oauth", as: :auth_at_provider

end
