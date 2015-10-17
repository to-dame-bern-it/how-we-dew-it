class SessionsController < ApplicationController
  def new
  end

  def create
    if request.post?
      u = User.find_by_email(params[:email])
      if u && u.authenticate(params[:password])
        session[:logged_in_user] = true
        redirect_to tasks_path, notice: "Login Success"
      else
        redirect_to login_path, notice: "Login Denied"
      end
    end
  end

  def destroy
    session[:logged_in_user] = false
    redirect_to login_path
  end
end
