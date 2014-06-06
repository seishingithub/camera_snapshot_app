Rails.application.routes.draw do
  root 'welcome#index'
  resources :photo_select
end

