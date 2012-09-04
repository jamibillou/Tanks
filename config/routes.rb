Tanks::Application.routes.draw do

  devise_for :users

  resources :clones, :tiroirs

  root :to => 'pages#index'
end
