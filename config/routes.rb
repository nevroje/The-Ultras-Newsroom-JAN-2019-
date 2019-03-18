Rails.application.routes.draw do
    devise_for :users
    resources :articles, only: [:index, :new, :create, :show, :edit, :update, :destroy]
    root controller: :articles, action: :index
end