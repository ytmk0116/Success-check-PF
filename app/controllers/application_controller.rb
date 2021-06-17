class ApplicationController < ActionController::Base
  helper_method :current_user
  #全てのコントローラーで使用できるようになる
  before_action :login_required
  #ログインしていない時に利用させない
  
  private
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  
  def login_required
    redirect_to login_url unless current_user
  end
end
