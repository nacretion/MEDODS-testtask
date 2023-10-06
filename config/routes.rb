Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  resources :patients, only: [:create] do
    resources :recommendations, only: [:index], controller: 'recommendations'
  end

  resources :consultation_requests, only: [:create] do
    resources :recommendations, only: [:create], controller: 'recommendations'
  end

  resources :recommendations, only: [:index]

  get 'medications/search_drug', to: 'medications#search_drug'
  get 'medications/search_by_reactionmeddrapt', to: 'medications#search_by_reactionmeddrapt'
  resources :notifications

end
