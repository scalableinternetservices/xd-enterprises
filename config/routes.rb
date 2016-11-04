Rails.application.routes.draw do
  get 'users/new'

  devise_for :users, controllers: { sessions: 'users/sessions' }
  get  'static_pages/home'
  
  #root 'static_pages#home'
  root to: 'static_pages#home'
  resources :users
  resources :microposts,          only: [:create, :destroy]
  match '/users/:username/:id', to: 'microposts#show', via: :get, as: :user_micropost
end