# A single point of entry for all the customizations and extensions needed for
# an action controller
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  # user_login:devise
  def require_user_signed_in
    return if user_signed_in?
    redirect_to new_user_session_path, flash: { error: 'You must be signed in to view this page.' }
  end
end
