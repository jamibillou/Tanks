Tanks::Application.routes.draw do

  devise_for :users

  resources :clones, :tiroirs

  root :to => 'tiroirs#index'
end
