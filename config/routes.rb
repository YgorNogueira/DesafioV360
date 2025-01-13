Rails.application.routes.draw do
  devise_for :users
  get "devise/sessions"
  resources :todos
  resources :tasks

  get "up" => "rails/health#show", as: :rails_health_check
  root "todos#index"
end
