class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  def current_user
    # session값이 없으면 수행하고 session값이 있으면 수행하지 않는다
    # \\= SQL문 수행을 덜하게 하는 트릭 - @user가 비어있는 경우에만 저장하기 위해
      @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorize
    if current_user.nil?
      flash[:alert] = "로그인을 해주세요"
      redirect_to '/'
    end
  end
end
