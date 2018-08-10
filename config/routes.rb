require 'sidekiq/web'

Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :announcements
      resources :notifications
      resources :services

      root to: "users#index"
    end
  get '/privacy', to: 'home#privacy'
  get '/terms', to: 'home#terms'
  resources :notifications, only: [:index]
  resources :announcements, only: [:index]
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  root to: 'home#index'

  # TODO: refactor question_answer to answer.
  # It's already in the question_threads module
  resources :question_threads do
    resources :question_answers, module: :question_threads
  end

  resources :question_answers, only: [] do 
    resources :comments, module: :question_threads
  end

  resources :accepted_answers, only: [:create], module: :question_threads

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
