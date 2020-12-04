Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

    # ~~ ITEMS ROUTES  ~~ #
  resources :items, only: [:index]
  get 'items/categories', to: 'items#categories'
  get 'items/sample-item', to: 'items#sample_item'

    #  ~~ SHOPPING CART ROUTES ~~ #
  post 'carts/add', to: 'carts#add_item'
  resources :carts, only: [:show, :create]
end
