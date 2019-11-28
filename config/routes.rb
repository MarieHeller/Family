Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'

  resources :fams do
    resources :bookings , only: [:new, :create, :edit]
  end

  resources :bookings, only: [:show, :edit, :update, :destroy] do
    # resources :reviews, only: [:new, :create]
    resources :bookings_reviews, only: [:new, :create]
  end

  # resources :reviews, only: [:edit, :update, :destroy]
  # resources :user do
  #   resources :f
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :profiles, only: [:show, :edit, :update]

  get "bookings/:id/accept", to: "bookings#accept", as: :accept
  get "bookings/:id/decline", to: "bookings#decline", as: :decline
end

