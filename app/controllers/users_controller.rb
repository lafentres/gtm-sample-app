class UsersController < ApplicationController
  before_action :is_logged_in, only: [:index, :edit, :update, :destroy]
  before_action :is_user, only: [:edit, :update]
  before_action :is_admin, only: [:destroy]

  def index
    @users = User.activated.page(params[:page]).per(10)
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  def show
    @user = User.find(params[:id])
    redirect_to root_url and return unless @user.activated
    @likes = @user.likes.page(params[:page]).per(5)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      session[:registration_event] = {status: 'success', user_type: 'registered', user_id: @user.id, method: 'on-site'}
      redirect_to root_url
    else
      session[:registration_event] = {status: 'fail', user_type: 'unregistered', method: 'on-site', error: 'form errors'}
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to user_url(@user)
    else
      render 'edit'
    end
  end


  private

  def user_params
    params.require(:user).permit(:username, :email, :password,
                                 :password_confirmation)
  end

end
