class SessionsController < ApplicationController

	def new
	end

	def create
	  user = User.find_by(name: params[:user][:name], email: params[:user][:email )
	  return head(:forbidden) unless user.authenticate(params[:user][:password_digest])
	  session[:user_id] = user.id
	  redirect_to root_path
	end

	def destroy
		cookies.delete :user_id
		redirect_to root_path
	end

end