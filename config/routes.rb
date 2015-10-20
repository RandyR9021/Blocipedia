Rails.application.routes.draw do

  resources :wikis
  root to:  'wikis#index'
end
