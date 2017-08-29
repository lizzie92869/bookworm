class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?
  before_action :authenticate_user!

  private

  def authenticate_user!
    if !logged_in?
      redirect_to signin_path
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end
end

end