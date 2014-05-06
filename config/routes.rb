Rails.application.routes.draw do
  get '/', to: 'welcome#index'

  # resources :camera
  get '/cameras/new' => 'cameras#new'

  post '/cameras/' => 'cameras#create'
  get '/cameras/:id' => 'cameras#show'

  get '/cameras' => 'cameras#index'


end

