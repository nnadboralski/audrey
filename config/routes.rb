Audrey::Engine.routes.draw do
 root :to => 'topics#index'

 get :index, to: 'topics#index'
end
