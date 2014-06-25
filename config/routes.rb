Rails.application.routes.draw do
  root 'welcome#index'
  resources :photo_select
  resources :ecards
end

