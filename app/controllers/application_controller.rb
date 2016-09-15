class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
    # devise_parameter_sanitizer.permit :sign_in, keys: [:login, :username, :email, :password, :remember_me]

end
