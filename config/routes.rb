Rails.application.routes.draw do
  
  resources :wikis
  root  'wiki#index'
end
