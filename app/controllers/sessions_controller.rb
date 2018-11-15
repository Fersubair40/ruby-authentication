class SessionsController < ApplicationController

  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
      # log in the user and redirect to the user's dashboard 
    else
      # create an error message
      flash.now[:danger] = 'Invalid Credentials'
    render 'new'
  end
  end

  def destroy

  end
end
