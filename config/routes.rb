Rails.application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'

  root "pages#home"
  
  get 'pages/home',to: 'pages#home'
  
  get '/signup', to: 'chefs#new'
  
  resources :recipes
  resources :chefs, except: [:new]
  resources :account_activation, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :ingredients, except: [:destroy]
  
  get "error", to: "pages#error"
  get "*path", to: redirect("/error")
end 
