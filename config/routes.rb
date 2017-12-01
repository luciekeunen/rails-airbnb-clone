Rails.application.routes.draw do


  get 'conversations/index'

  get 'conversations/show'

  get 'dashboards/dashboard_main'

  get 'dashboards/inbox'



  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks', sessions: "users/sessions", registrations: "users/registrations" }
  resources :profiles, only: [ :show, :new, :create, :edit, :update ]
  resources :collection_items, only: [ :index, :show, :create, :new, :edit, :update, :destroy] do
    resources :reviews, only: [ :new, :create ]
    resources :reservations, only: [ :create ]
    resources :messages, only: [ :index, :show, :new, :create ]
  end

  resources :conversations do
    resources :messages
  end

  resources :posts do
    resources :conversations
  end

  get 'reservations/:id/:accept', to: 'reservations#accept', as: 'reservation_accept'
  get 'reservations/index_borrowed', to: 'reservations#index_borrowed'
  get 'reservations/index_lended', to: 'reservations#index_lended'

  get 'dashboards/dashboard_main'
  get 'dashboards/inbox'
  get 'dashboards/my_books'
  get 'dashboards/my_rentals'

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
