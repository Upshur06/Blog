Rails.application.routes.draw do


  get 'blogs/index'
  get 'blogs/new'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

get "/signin" => "sessions#new"
post "/signin" => "users#signin"
post "/logout" =>  "sessions#destroy"

root "users#index"

  resources :users
  resources :blogs 
  resources :comments

end
