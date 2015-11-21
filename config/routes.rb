Rails.application.routes.draw do

  devise_for :users, controller: {registrations: "users/registrations"}
  resources :users, only: [:show]

  resources :wikis do
    resources :collaborators, only: [:new, :create, :destroy]
  end

  authenticated :user do
    root to:  'wikis#index', as: :authenticated_root
  end

  root to: 'welcome#index'

  resources :charges, only: [:new, :create]

end
