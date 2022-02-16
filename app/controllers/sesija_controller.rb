class SesijaController < ApplicationController
    before_action :logged_in_redirect, only: [:new, :create]
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

        private

  def logged_in_redirect
    if logged_in?
      flash[:error] = "You are already logged in"
      redirect_to root_path
    end
  end

end
