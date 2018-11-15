Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  #resources :users do
    #get 'trips/behind', to: 'trips#behind'
  resources :todolists
  resources :trips, only: [:index]
  end
  resources :todolists
  resources :listings, only: [:destroy]
  resources :trips do
    resources :listings, except: [:index, :destroy]
  end
  resources :categories, only: [:index, :trip]
  resources :countries, only: [:index, :trip]
  get '/search', to: 'trips#search'
  get '/auth/google/callback', to: 'users#google_login'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
