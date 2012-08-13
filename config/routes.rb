Tanks::Application.routes.draw do

  devise_for :users

  resources :clones

  root :to => 'pages#index'
end
