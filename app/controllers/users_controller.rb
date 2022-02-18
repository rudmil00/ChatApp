class UsersController < ApplicationController
  
  def registracija
    @user = User.new
  end

  def create
   
    @user = User.new(user_params)

    if @user.save
      redirect_to "/"
      flash[:success] = "Uspešno ste napravili nalog."
    else
       flash[:error] = "Korisničko ime već postoji."
       redirect_to '/signup'
    end
       
  end

  private
  def user_params
    params.require(:user).permit(:username,:password)
  end

end 