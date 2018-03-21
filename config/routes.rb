Rails.application.routes.draw do

  get 'users/show'

  devise_for :users

  get 'welcome/index'

  resources :users do
    resources :items, only: [:create, :destroy]
  end

  root 'welcome#index'
end
