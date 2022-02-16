class SesijaController < ApplicationController
  def login
  end

  def create

    user = User.find_by(username:params[:sesija][:username])
    
    if user && user.authenticate(params[:sesija][:password])
      session[:user_id] = user.id
      flash[:success] = "You have successfully logged in"
      redirect_to "/"
    else
      flash.now[:error] = "There was something wrong with your login information"
     # render 'login'
     redirect_to "/login"
    end


  end

   def destroy
    session[:user_id] = nil
    flash[:success] = "You have successfully logged out"
    redirect_to "/login"
  end

end
