Rails.application.routes.draw do
  root 'sessions#welcome'
  get 'doctors/home'
  get 'doctors/new'
  get 'doctors/create'
  get '/patients' => 'patients#index'
  get 'patients/home'
  get 'patients/new'
  get 'patients/create'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/login'
  get 'sessions/welcome'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :patients, only: [:new, :create, :show, :home]
  resources :doctors
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'

  # get ‘patients/signup’ => ‘patients#new’
  # post ‘/patients’ => ‘patients#create’

  # get ‘doctors/signup’ => ‘doctors#new’
  # post ‘/doctors’ => ‘doctors#create’

  
end
