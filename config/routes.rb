Rails.application.routes.draw do
  resources :applications
  resources :jobs
  resources :profiles
  root 'pages#index'

  get 'pages/how_it_works'

  get 'pages/support'

  get 'pages/user_home'

  get 'pages/sell_time'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


