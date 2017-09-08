class UsersController < ApplicationController
#before_action :authorize_user, except: [:index, :new, :create]
  #signup form
  def new
    @user = User.new
  end

  def create
  @user = User.new(user_params)
     if @user.save
       #save the user
       #send email confirmation
       UserMailer.signup_confirmation(@user).deliver
       redirect_to root_path
       flash[:alert] = "Please confirm your account by clicking the link in the email you just sent you."
     else
       render :new
     end
   end

  def new_token
      SecureRandom.urlsafe_base64
  end

   def remember_me
   end

   def forgot
     @user = User.find_by(params[:email])
   end


   def update
    # @user = User.find_by(params[:email])
   end


  def show
    @user = User.find(params[:id])
  end


   private


  def user_params
       params.require(:user).permit(:name, :email, :role, :password, :password_repeated, :remember_password, :verification_code)
  end

end