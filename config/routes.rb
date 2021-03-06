Rails.application.routes.draw do
  
  root 'static_pages#home'

  #Static Pages
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'

  #Users  
  resources :users do
    member do
      get :following, :followers
    end
  end
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  #Sessions
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  #Account activations
  resources :account_activations, only: [:edit]

  #Password resets
  resources :password_resets, only: [:new, :create, :edit, :update]

  #Microposts
  resources :microposts, only: [:create, :destroy]

  #Relationships
  resources :relationships, only: [:create, :destroy]

end
