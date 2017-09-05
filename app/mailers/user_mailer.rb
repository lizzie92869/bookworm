class UserMailer < ApplicationMailer
	default from: "no-reply@bookworm.com"

	def signup_confirmation(user)
		@user = user

		#url for developpement to change for production 
		#@url = "http://localhost:3000/verify/#{User.new_token}"
		#@url = "http://localhost:3000/verify/#{}"
		mail(to: @user.email, subject: 'Sign Up Confirmation')
		
	end

end
