Rails.application.routes.draw do
  root 'rpns#index'
  resources :rpns
end
