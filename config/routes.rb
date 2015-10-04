Rails.application.routes.draw do

  resources :wikis

  root to: 'wiki#index'
end
