class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end  

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)    
    if @user.save
      flash[:success] = 'Welcome to rails tutorail 5 App'
      redirect_to @user
      # handle a successful save .
    else
      render 'new'
    end  
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end
