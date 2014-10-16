Audrey::Engine.routes.draw do
  resources :topics do
    member do
      get :up_vote, action: 'up_vote'
      get :down_vote, action: 'down_vote'
    end
  end

  root :to => 'topics#index'
  get :index, to: 'topics#index'
end
