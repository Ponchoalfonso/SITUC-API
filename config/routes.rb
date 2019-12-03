Rails.application.routes.draw do
  # devise_for :users

  resources :sessions, only: [:create, :destroy], defaults: { format: :json }
  post 'sessions/current_user', to: 'sessions#current_user', defaults: { format: :json }
  post 'sessions/charge_credit', to: 'sessions#charge_credit', defaults: { format: :json }

  resources :users, only: [:create], defaults: { format: :json }
  resources :buses, only: [:create], defaults: { format: :json }
  resources :payments, only: [:create], defaults: { format: :json }
  post 'users/payments', to: 'users#payments', defaults: {format: :json }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
