class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  allow_browser versions: :modern

  def after_sign_up_path_for(resource)
    todos_path # Caminho para redirecionar após criar a conta
  end

  # Personaliza o caminho após login
  def after_sign_in_path_for(resource)
    todos_path # Redireciona para todos#index também ao logar
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :name,  { profile_attributes: [ :avatar ] } ])
    devise_parameter_sanitizer.permit(:account_update, keys: [ :name, { profile_attributes: [ :avatar ] } ])
  end
end
