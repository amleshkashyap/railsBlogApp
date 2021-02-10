Rails.application.routes.draw do
  require 'sidekiq/web'
  root 'articles#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'

  resources :users, only: [:new, :create]
  # articles is a resource, and each article has_many comments, which is also a resource
  resources :articles do
    resources :comments
  end

  mount Sidekiq::Web => '/sidekiq'
end
