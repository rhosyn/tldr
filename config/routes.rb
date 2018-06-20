Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'index', to: 'pages#index'
  get 'history', to: 'pages#history'
  get 'my_articles', to: 'pages#my_articles'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  require "sidekiq/web"
  authenticate :user, lambda { |u| u.admin } do
    mount Sidekiq::Web => '/sidekiq'
  end
end
