module SessionsHelper
  def remember(user)
    user.remember
    session[:user_id] = user.id
  end

  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find(user_id)
    end
  end

  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end

  def logged_in?
    !current_user.nil?
  end

  def forget(user)
    user.forget
    session.delete(:user_id)
    session.delete(:remember_token)
  end
end
