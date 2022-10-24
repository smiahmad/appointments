Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
   get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root "pages#home"
  get 'about', to: 'pages#about'
  resources :users, only: [:show]
end
