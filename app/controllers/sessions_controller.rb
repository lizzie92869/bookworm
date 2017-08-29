class SessionsController < ApplicationController

	#login form
	def new
	end

	def create
	  user = User.find_by(name: params[:user][:name])
	  if user && user.authenticate(params[:user][:password])
		  session[:user_id] = user.id
		  redirect_to root_path
		else
			render :new
		end
	end

	def destroy
		session.delete :user_id
		@current_user = nil
		redirect_to root_path
	end

end