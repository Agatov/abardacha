Abardacha::Application.routes.draw do
  root to: 'third_version#index'

  resources :orders, only: :create
end
