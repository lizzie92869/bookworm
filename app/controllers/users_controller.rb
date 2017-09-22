class UsersController < ApplicationController
before_action :authorize_user, except: [:index, :new, :create]
before_action :authenticate!, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
  @user = User.new(user_params)
     if @user.save
       #save the user
       #send email confirmation
       UserMailer.signup_confirmation(@user).deliver
       flash[:message] = "Please confirm your account by clicking the link in the email you just sent you."
       redirect_to root_path
     else
       flash[:message] = "Ooooppss, something went wrong!"
       render :new
     end
   end

    def show
    @user = User.find_by(params[:email])
    end

   def remember_me
   end

   def forgot
     @user = User.find_by(params[:email])
   end


   def update
    @user = User.find_by(params[:email])
   end


  def confirm_email
      user = User.find_by_confirm_token(params[:id])
      if user
        user.email_activate
        flash[:message] = "Welcome to Bookworm! Your email has been confirmed.
        Please sign in to continue."
        redirect_to signin_url
      else
        flash[:message] = "Sorry. User does not exist"
        redirect_to root_url
      end
  end


   private


  def user_params
       params.require(:user).permit(:name, :email, :role, :password, :password_confirmation, :remember_password, :password_reset_token)
  end

  def authorize_user
    authorize @user
  end



end