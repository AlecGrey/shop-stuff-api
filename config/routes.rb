Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

    # ~~ ITEMS ROUTES  ~~ #
  resources :items, only: [:index, :destroy]
  get 'items/categories', to: 'items#categories'
  get 'items/sample-item', to: 'items#sample_item'

    #  ~~ CART ROUTES ~~ #
  post 'carts/add', to: 'carts#add_item'
  get 'carts/:id/empty', to: 'carts#empty'
  resources :carts, only: [:show, :create]

    # ~~ SCORES ROUTES ~~ #
  resources :scores, only: [:index, :create]

    # ~~ USERS ROUTES ~~ #
  resources :users, only: [:create, :update, :destroy]
  get 'login', to: 'users#login'
end
