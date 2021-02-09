Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "articles#index"

  # articles is a resource, and each article has_many comments, which is also a resource
  resources :articles do
    resources :comments
  end
end
