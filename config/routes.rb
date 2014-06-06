Rails.application.routes.draw do
  root 'welcome#index'
  get '/photo_select', to: 'photo_select#index'
  resources :reviews
  resources :photo_contest

end

