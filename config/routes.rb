Pictr::Application.routes.draw do
  devise_for :users
  resources :albums
  resources :photos
  resources :users
  root :to => "static_pages#index"
end
