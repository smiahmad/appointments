Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
   get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root "pages#home"
  get 'about', to: 'pages#about'
  resources :users, only: [:show]
  resources :gate_appointments
  resources :trucking_companies
  get 'my_gate_appointments', to: 'users#my_gate_appointments'

end
