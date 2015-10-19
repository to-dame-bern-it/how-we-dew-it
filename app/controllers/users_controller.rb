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
      ["Personal", "Work", "Family"].each do |c|
      Category.create(
        name: c,
        color: "#{rand(120..255)},#{rand(120..255)},#{rand(120..255)}",
        user_id: @user.id
        )
      end

      ["Todo", "Doing", "Done", "One Day"].each do |s|
        Status.create(
          name: s,
          color: "#{rand(120..255)},#{rand(120..255)},#{rand(120..255)}",
          user_id: @user.id
        )
      end

      Task.create(
        user_id: @user.id,
        name: "My first task!",
        description: "We deserve much cookie",
        due_at: Faker::Time.between(DateTime.now + 10, DateTime.now),
        status_id: @user.statuses.first.id,
        category_id: @user.categories.first.id,
       )
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
