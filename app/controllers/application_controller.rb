class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def index

  end

  private

  def is_logged_in
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  def is_user
    @user = User.find(params[:id])
    unless current_user?(@user)
      redirect_to(root_url)
    end
  end

  def is_admin
    redirect_to(root_url) unless current_user.admin?
  end
end
