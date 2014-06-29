Rails.application.routes.draw do
  root 'welcome#index'
  resources :photo_select
  resources :ecards
  resources :users
  resources :messages
end

