Rails.application.routes.draw do
  root 'welcome#index'
  resources :photo_select
  resources :photos
  resources :users
  resources :photo_uploads
  resources :messages do
    member do
      get 'preview'
      get 'deliver'
    end
  end
end

