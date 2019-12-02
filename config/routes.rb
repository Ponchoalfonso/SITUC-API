Rails.application.routes.draw do
  # devise_for :users

  resources :sessions, only: [:create, :destroy], defaults: { format: :json }
  resources :users, only: [:create], defaults: { format: :json }
  resources :buses, only: [:create], defaults: { format: :json }
  resources :payments, only: [:create], defaults: { format: :json }
  post 'users/payments', to: 'users#payments', defaults: {format: :json }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
