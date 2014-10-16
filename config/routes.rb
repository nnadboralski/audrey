Audrey::Engine.routes.draw do
  resources :topics

  root :to => 'topics#index'
  get :index, to: 'topics#index'
end
