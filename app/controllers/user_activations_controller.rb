class UserActivationsController < ApplicationController

  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:token])
      user.activate
      log_in(user)
      flash[:success] = "Account activated!"
      session[:login_event] = {event: 'login', status: 'success', user_type: 'registered', user_id: user.id, method: 'on-site'}
      redirect_to user_url(user)
    else
      flash[:danger] = "Invalid activation link"
      session[:login_event] = {event: 'login', status: 'fail', user_type: 'unregistered', method: 'on-site', error: 'invalid activation link'}
      redirect_to root_url
    end
  end
end