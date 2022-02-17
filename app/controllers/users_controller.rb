class UsersController < ApplicationController
  def new
    # @user = User.new
  end

  def create
   
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "Uspešno ste napravili nalog 😎 {@user.username}"
      redirect_to "/"
    else
       redirect_to '/signup'
    end
       
  end

  private
  def user_params
    params.require(:user).permit(:username,:password)
  end

end 