class UsersController < ApplicationController
  
  before_action :sign_up_redirect, only: [:registracija]

  def registracija
    @user = User.new
  end


  def edit
    @user = User.find(params[:id])
  end

  def update

    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:notice] = "Uspešno ste izmenili Vaš nalog."
      redirect_to "/"

    else
      flash[:error] = "Niste ništa izmenili."
      redirect_to user_path
    end
    
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
      redirect_to "/login"

    else
       flash[:error] = "Korisničko ime već postoji."
       redirect_to "/signup"
    end
       
  end

  def destroy 
           
    @user = User.find(params[:id])
    
     Poruka.where(:user_id => current_user[:id]).destroy_all
    @user.delete
    flash[:notice]="Uspesno ste obrisali nalog !"

    session.delete(:user_id)
    @current_user = nil

    redirect_to login_path
  end
  


  private
  def sign_up_redirect
    if logged_in?
      flash[:error] = "Prvo se morate odjaviti."
      redirect_to root_path
    end
  end

  
  private
  def user_params
    params.require(:user).permit(:username, :password)
  end

end 