Rails.application.routes.draw do

  resources :attractions

  devise_scope :user do
    get '/users/new', to: 'users/registrations#new', as: :new_user_registration
    get '/signin', to: 'users/sessions#new', as: :new_session
    post '/users', to: 'users/registrations#create'
    post '/users/sign_in', to: 'users/sessions#create'
    delete '/users/sign_out', to: 'users/sessions#destroy'
  end

  post "/ride", to: 'users#ride', as: :ride

  resources :users
  devise_for :users

  root 'static#home'

end