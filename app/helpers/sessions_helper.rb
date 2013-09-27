module SessionsHelper
  def signed_in?
    !current_user.nil?
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def signed_in_user
    unless signed_in?
      redirect_to root_path, notice: "Please sign in using OpenID."
    end
  end

end
