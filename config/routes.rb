Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  root 'menus#top'

  get 'terms', to: 'pages#terms'
  get 'privacy', to: 'pages#privacy'
  get 'line', to: 'pages#line'

  resources :users, only: %i[new create destroy]
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  resources :menus, only: %i[index new create show edit update destroy] do
    collection do
      get :suggest
      get :search
      get :likes
    end
  end
  resources :likes, only: %i[create destroy]
  resource :profile, only: %i[edit update]
  resources :password_resets, only: %i[new create edit update]

  post "oauth/callback" => "oauths#callback"
  get "oauth/callback" => "oauths#callback" # for use with Github, Facebook
  get "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end