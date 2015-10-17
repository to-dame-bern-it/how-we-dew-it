class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :logged_in?
  #before_action :deny_access

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'user was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: 'user was successfully destroyed.'
  end

  private
    def set_user
      @logged_in_user = User.find_by_id(session[:user_id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password)
    end

    def logged_in?
      redirect_to login_path "Must be Logged in" unless session[:logged_in_user]
    end

    # def deny_access
    #   redirect_to login_path, notice: "Access Denied" unless session[:logged_in_user]
    # end
end
