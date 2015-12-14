Rails.application.routes.draw do
  root to: 'pages#index'
  resources :goals do
    resources :notes
  end
  resources :users
  resources :user_sessions, only: [ :new, :create, :destroy ]

  get 'pages/:page' => 'pages#show'
  get 'login' => 'user_sessions#new'
  get 'logout' => 'user_sessions#destroy'
end
