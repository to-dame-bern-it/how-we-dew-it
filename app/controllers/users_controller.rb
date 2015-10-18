class UsersController < ApplicationController
  before_action :require_login, only: [:index, :show, :edit, :update, :destroy]


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
      session[:user_id] = @user.id
      redirect_to tasks_path, notice: 'User was successfully created.'
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
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
