Rails.application.routes.draw do

  get 'jobs/qer'

  resources :jobs do 
    member do 
      post 'apply'
    end
  end
  resources :profiles
  root 'pages#index'
  get 'pages/how_it_works'
  get 'pages/support'
  get 'pages/user_home'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


