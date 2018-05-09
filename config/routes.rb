Rails.application.routes.draw do

  get 'jobs/qer'

  resources :jobs do 
    member do 
      post 'apply'
      post 'application_update'
      post 'charge'

    end
  end
  resources :profiles
  root 'pages#index'
  get '/how_it_works', to: 'pages#how_it_works'
  get '/support', to: 'pages#support'
  post '/support', to: 'pages#support_email'
  get 'pages/user_home'


  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end