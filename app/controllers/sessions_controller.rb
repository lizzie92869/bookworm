class SessionsController < ApplicationController

	#login form
	def new
		@user = User.new
	end

	def create
		if auth_hash = request.env["omniauth.auth"]
		# 	they logged in via OAuth
		oauth_uid = request.env["omniauth.auth"]["info"]["uid"]
		oauth_email = request.env["omniauth.auth"]["info"]["email"]
		oauth_name = request.env["omniauth.auth"]["info"]["name"]
		# the user comes from github for sure
			if user = User.find_by(:uid=> oauth_uid)
			# he came from github and we already have him in the db = log him in 
			session[:user_id] = user.id
			redirect_to root_path
			flash[:alert] = "Succesfully logged in from github sign / returning user"
			else
			# we know the user (through github) but it's the first time they come to my website
			# we need to create the user
			random_password = SecureRandom.hex
			user = User.create(:uid => oauth_uid, :name => oauth_name, :email => oauth_email, :password => random_password, :password_repeated => random_password)
			session[:user_id] = user.id
			redirect_to root_path
			flash[:alert] = "Succesfully logged in from github sign in for the first time!"
		end 

		else
		# 	#normal login with email and psw
		  user = User.find_by(email: params[:user][:email])
		  if user && user.authenticate(params[:user][:password])
			  session[:user_id] = user.id
			  redirect_to root_path
			  flash[:alert] = "Succesfully logged in from traditionnal sign in!"
		  else
				render :new
		  end
		end
	end

	def destroy
		session.delete :user_id
		@current_user = nil
		redirect_to root_path
	end

end