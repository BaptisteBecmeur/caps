Rails.application.routes.draw do

  get 'users/index'

  get 'users/show'

  get 'users/destroy'

  resources :services

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
