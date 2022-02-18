class UsersController < ApplicationController
  
  before_action :sign_up_redirect, only: [:registracija]

  def registracija
    @user = User.new
  end

  def create
   
    @user = User.new(user_params)


    if user_params[:username].length < 6 || user_params[:username].length > 20
      flash[:error] = "Korisničko ime mora imati između 6 i 25 znakova!"
      redirect_to "/signup"

    elsif user_params[:password].length < 6 || user_params[:password].length > 25
      flash[:error] = "Šifra mora imati između 6 i 25 znakova!"
      redirect_to "/signup"

    elsif @user.save
      flash[:success] = "Uspešno ste napravili nalog."
      redirect_to "/"

    else
       flash[:error] = "Korisničko ime već postoji."
       redirect_to "/signup"
    end
       
  end

  private
  def user_params
    params.require(:user).permit(:username,:password)
  end


  def sign_up_redirect
    if logged_in?
      flash[:error] = "Prvo se morate odjaviti."
      redirect_to root_path
    end
  end

end 