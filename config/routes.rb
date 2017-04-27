Rails.application.routes.draw do
  get 'services/new'

  get 'services/create'

  get 'services/show'

  get 'services/index'

  get 'services/edit'

  get 'services/update'

  get 'services/destroy'

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
