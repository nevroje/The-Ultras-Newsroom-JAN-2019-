Rails.application.routes.draw do
    devise_for :users
    resources :articles, only: [:index, :new, :create, :show, :edit, :update, :destroy]
    root controller: :articles, action: :index
    
    namespace :content_management do
        resources :articles
    end
end