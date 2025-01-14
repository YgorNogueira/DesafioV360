Rails.application.routes.draw do
  get "home/index"
  get "profiles/edit"
  get "profiles/update"
  devise_for :users
  get "devise/sessions"
  resources :todos
  resources :tasks
  resource :profiles, only: [ :edit, :update, :show ]

  get "up" => "rails/health#show", as: :rails_health_check
  root "home#index"
end
