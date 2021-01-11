Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items, only: [:new, :create]
  get '/users/sign_up', to: 'registrations#new'
  get '/users/sign_in', to: 'sessions#new'
  get '/users/sign_out', to: 'sessions#destroy'
end
