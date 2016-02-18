class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
  end

  def create
    if request.post?
      u = User.find_by_email(params[:email])
      if u && u.authenticate(params[:password])
        session[:user_id] = u.id
        redirect_to tasks_path, notice: "Login Success"
      else
        redirect_to login_path, notice: "Login Denied"
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
