class UsersController < ApplicationController

  #signup form
  def new
    @user = User.new
  end

  def create
  @user = User.new(user_params)
     if @user.save
       session[:user_id] = @user.id
       redirect_to root_path, notice: "Account successfully created"
     else
       render :new
     end
   end


  def show
    @user = User.find(params[:id])
  end


   private


  def user_params
       params.require(:user).permit(:name, :email, :role, :password_digest, :password_repeated, :verification_code)
  end

end