module UsersHelper

	def authenticated?(token)
		if (cookies[:auth_token] == @user.remember_digest)
		end
	end

end