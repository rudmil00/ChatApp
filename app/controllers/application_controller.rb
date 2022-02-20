class ApplicationController < ActionController::Base
  
  helper_method :current_user, :logged_in?
  before_action :set_last_seen_at, if: :logged_in?


  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # sklonio dva uzvicnika
  def logged_in?
    current_user
  end

  def require_user
    if !logged_in?
      flash[:error] = "Prvo se morate prijaviti."
      redirect_to login_path
    end
  end

  def set_last_seen_at
    current_user.touch(:last_seen_at)
  end
end
