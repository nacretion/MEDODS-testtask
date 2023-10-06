Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  resources :patients, only: [:index, :show, :create, :update, :destroy] do
    resources :recommendations, only: [:index], controller: 'recommendations'
  end

  resources :consultation_requests, only: [:create] do
    resources :recommendations, only: [:create], controller: 'recommendations'
  end

  resources :recommendations, only: [:index]

  resources :external_api
  resources :notifications
end
