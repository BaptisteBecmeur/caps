Rails.application.routes.draw do

  get 'uploads/index'

  get 'uploads/show'

  get 'uploads/new'

  get 'uploads/create'

  get 'uploads/update'

  get 'uploads/edit'

  get 'uploads/destroy'

  root to: 'pages#home'

  resources :services

  devise_for :users, controllers: { registrations: 'users/registrations' }
    resources :users, only: [:show, :index, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
