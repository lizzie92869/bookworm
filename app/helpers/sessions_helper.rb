module SessionsHelper

def authenticate_user!
    if !logged_in?
      flash[:message] = "Please, sign in"
      redirect_to signin_path
    end
  end



def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if @user && @user.authenticated?(cookies[:auth_token])
        log_in @user
        @current_user = @user
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
    cookies.permanent.signed[:user_id] = @user.id
    cookies.permanent[:auth_token] = @user.auth_token
  end
  

  def forget(user)
    cookies.delete(:user_id)
    cookies.delete(:auth_token)
  end
  
end
  