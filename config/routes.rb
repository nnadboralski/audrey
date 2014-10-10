Audrey::Engine.routes.draw do
  get 'topics/index'
  get 'topics/create'
  get 'topics/show'
  get 'topics/update'

 root :to => 'topics#index'
 get :index, to: 'topics#index'
end
