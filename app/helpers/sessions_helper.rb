# SessionsHelper
module SessionsHelper
  # when the page require the user to be logged in
  def authenticate_user!
    redirect_to signin_path unless logged_in?
  end

  def current_user
    # check if the user has a session
    if (user_id = session[:user_id])
      # if yes, find the current_user
      @current_user ||= User.find_by(id: user_id)
    # if no, check if the user has a cookie
    elsif (user_id = cookies.signed[:user_id])
      # if yes, find the user
      user = User.find_by(id: user_id)
      if user && user.authenticated_with_token?(cookies[:remember_digest])
        log_in user
        @current_user = user
      end
    end
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def logged_in?
    !current_user.nil?
  end

  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_digest] = user.remember_digest
  end

  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:auth_token)
  end
end
