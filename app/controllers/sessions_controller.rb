class SessionsController < ApplicationController

  def create
    user = User.find_by(name: params[:user][:name])
    return head(:forbidden) unless user.authenticate(params[:user][:password_digest])
    session[:user_id] = user.id
    redirect_to root_path
  end

end