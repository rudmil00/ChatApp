class SesijaController < ApplicationController
  
  before_action :logged_in_redirect, only: [:new, :create, :login]
  
  def login
  end

  def create

    user = User.find_by(username:params[:sesija][:username])
    
    if user && user.authenticate(params[:sesija][:password])
      session[:user_id] = user.id
      flash[:success] = "Uspešno ste se prijavili."
      redirect_to "/"
    elsif !user.authenticate(params[:sesija][:password])
      flash[:error] = "Korisničko ime ili šifra nisu ispravni!"
      redirect_to "/login"
    
    # hocu da ubacimo da ne mozes da se prijavis ako si prijavljen
    else
      flash[:error] = "Već ste prijavljeni."
      redirect_to "/login"
    end


  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Uspešno ste se odjavili."
    redirect_to "/login"
  end

  private

  def logged_in_redirect
    if logged_in?
      flash[:error] = "Već ste prijavljeni."
      redirect_to root_path
    end
  end

end
