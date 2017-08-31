class UsersController < ApplicationController

  #signup form
  def new
    @user = User.new
  end

  def create
  @user = User.new(user_params)
     if @user.save
       session[:user_id] = @user.id
       redirect_to root_path
       flash[:alert] = "Account succesfully created!"
     else
       render :new
     end
   end

   def remember_me
   end

   def forgot
    @user = User.new
   end


  def show
    @user = User.find(params[:id])
  end


   private


  def user_params
       params.require(:user).permit(:name, :email, :role, :password, :password_repeated, :remember_password, :verification_code)
  end

end