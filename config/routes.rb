Rails.application.routes.draw do
  root 'welcome#index'
  resources :photo_select
  resources :photos
  resources :users
  resources :messages
end

