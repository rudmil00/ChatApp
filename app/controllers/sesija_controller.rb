class SesijaController < ApplicationController
  
  before_action :logged_in_redirect, only: [:create, :login]
  
  def login
  end

  def create

    user = User.find_by(username:params[:sesija][:username])


    # hocu da ubacimo da ne mozes da se prijavis ako si prijavljen

    if user && user.authenticate(params[:sesija][:password])
      session[:user_id] = user.id
      flash[:success] = "Uspešno ste se prijavili."
      redirect_to "/"
    else 
      flash[:error] = "Korisničko ime ili šifra nisu ispravni!"
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
