Audrey::Engine.routes.draw do
  get 'topics/new'
  post 'topics/create'
  patch 'topics/update'

  root :to => 'topics#index'
  get :index, to: 'topics#index'
end
