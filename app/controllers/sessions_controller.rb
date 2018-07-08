class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in(user)
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        session[:login_event] = {event: 'login', status: 'success', user_type: 'registered', user_id: user.id, method: 'on-site'}
        redirect_back_or(root_url)
      else
        flash[:warning] = "Account not activated. Check your email for the activation link."
        session[:login_event] = {event: 'login', status: 'fail', user_type: 'registered', method: 'on-site', error: 'account not activated'}
        redirect_to root_url
      end
    else
      flash.now[:danger] = 'Invalid email/password combination'
      session[:login_event] = {event: 'login', status: 'fail', user_type: 'unregistered', method: 'on-site', error: 'invalid credentials'}
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
