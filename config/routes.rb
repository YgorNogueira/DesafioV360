Rails.application.routes.draw do
  get "profiles/edit"
  get "profiles/update"
  devise_for :users
  get "devise/sessions"
  resources :todos
  resources :tasks
  resource :profile, only: [ :edit, :update ]

  get "up" => "rails/health#show", as: :rails_health_check
  root "todos#index"
end
