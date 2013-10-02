Abardacha::Application.routes.draw do
  root to: 'second_version#index'

  resources :orders, only: :create

  resources :simple, controller: 'simple'
end
