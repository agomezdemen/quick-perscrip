Rails.application.routes.draw do
  root 'sessions#welcome'
  get 'doctors/home'
  get 'doctors/new', to: 'doctors#new'
  get 'doctors/create'
  get 'doctors/login', to: 'doctors#login'
  get '/patients' => 'patients#index'
  get 'patients/home'
  get 'patients/new', to: 'patients#new'
  get 'patients/create'
  get 'patients/login', to: 'patients#login'
  post '/login', to: 'sessions#create'
  get 'sessions/welcome'
  get 'appointments/new'
  get 'prescriptions/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :appointments
  resources :drugs
  resources :prescriptions
  resources :licenses
  resources :patients, only: [:new, :create, :show, :home]
  resources :doctors
  
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'

  # get ‘patients/signup’ => ‘patients#new’
  # post ‘/patients’ => ‘patients#create’

  # get ‘doctors/signup’ => ‘doctors#new’
  # post ‘/doctors’ => ‘doctors#create’

  
end
