require "sidekiq/web"

Rails.application.routes.draw do

  devise_for :users
  root to: 'scores#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :scores, only: [:index, :show, :new, :create] do
    member do
      get "/viewer", to: 'scores#viewer'
    end
  end
  resources :collections, only: [:new, :create, :show]

  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  resources :pages, only: [] do
    resources :annotations, only: :create

  end

  resources :users, only: [:show]
end
