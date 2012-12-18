Tanks::Application.routes.draw do

  devise_for :users

  resources :clones, :tiroirs, :users

  root :to => 'pages#index'
end
