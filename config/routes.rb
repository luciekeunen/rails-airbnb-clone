Rails.application.routes.draw do

  devise_for :users
  resources :profiles, only: [ :show, :new, :create, :edit, :update ]
  resources :collection_items, only: [ :index, :show, :create, :new ] do
    resources :reviews, only: [ :new, :create ]
    resources :reservations, only: [ :new, :create, :edit, :update, :index]
    resources :messages, only: [ :index, :show, :new, :create]
  end

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
