class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def check_profil
    redirect_to new_user_registration_path
  end
end
