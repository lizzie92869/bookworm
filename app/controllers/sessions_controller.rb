# SessionsController
class SessionsController < ApplicationController
  before_action :current_user, only: [:index]

  # login form
  def new
    @user = User.new
  end

  # this has lots of duplicated logic/code
  def create
    if request.env['omniauth.auth']
      # they logged in via OAuth
      oauth_uid = request.env['omniauth.auth']['info']['uid']
      oauth_email = request.env['omniauth.auth']['info']['email']
      oauth_name = request.env['omniauth.auth']['info']['name']
      if (user = User.find_by(uid: oauth_uid))
        # he came from github and we already have him in the db = log him in
        log_in user
        flash[:message] = 'Succesfully logged in from github/returning user'
      else
        random_password = SecureRandom.hex
        user = User.create(uid: oauth_uid,
                           name: oauth_name,
                           email: oauth_email,
                           password: random_password,
                           password_repeated: random_password)
        log_in user
        flash[:message] = 'Succesfull sign in for the first time!'
      end
      render 'users/user_profile'
    else
      # normal login with email and psw
      user = User.find_by_email(params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        log_in user
        # save the remember_digest
        params[:remember_me] == '1' ? remember(user) : forget(user)
        flash[:message] = 'Succesfully logged in from traditionnal sign in!'
        redirect_to root_path
      else
        flash[:message] = 'Invalid email/password combination'
        render 'new'
      end
    end
  end

  def destroy
    session.delete :user_id
    @current_user = nil
    redirect_to root_path
  end
end
