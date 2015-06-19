Rails.application.routes.draw do
  root 'static_pages#landing'

  resources :users do
  	member do
  		get :activate
  	end
  end

  resources :user_sessions

  get 'login' => 'user_sessions#new', :as => :login
	post 'logout' => 'user_sessions#destroy', :as => :logout

end
