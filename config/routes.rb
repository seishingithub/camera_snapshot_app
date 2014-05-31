Rails.application.routes.draw do
  root 'welcome#index'
  resources :reviews
  resources :photo_contest

end

