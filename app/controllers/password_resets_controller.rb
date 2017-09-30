class PasswordResetsController < ApplicationController
 
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    user.send_password_reset if user
    flash[:message] = "Email sent with password reset instructions."
    redirect_to root_url
  end

  def edit
    @user = User.find_by_password_reset_token!(params[:id])
  end

  def update
    @user = User.find_by_password_reset_token!(params[:id])

    if @user.password_reset_sent_at < 2.hours.ago
  	 flash[:message] =  "Password reset has expired."
      redirect_to new_password_reset_path
    elsif @user.update_attributes(params.require(:user).permit(:password, :password_confirmation))
      flash[:message] = "Password has been reset!" 
      redirect_to root_url
    else
      render :edit
    end
  end

end
