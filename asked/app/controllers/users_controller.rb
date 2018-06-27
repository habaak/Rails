class UsersController < ApplicationController
  def index
  end

  def new
  end

  def create
    # 1. email 검증 User.find_by(email: 값)
    unless User.find_by(email: params[:email])
      # 1-1. 맞으면, 비밀번호 확인
      @user = User.new(username: params[:username], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])

      if @user.save
        # 1-1-1. 비밀번호가 같으면 가입
        #가입이 되면, true + 저장이 되고

        flash[:notice]="#{user.username}님 회원가입을 축하합니다."
        redirect_to '/'
      else
        # 1-1-2. 비밀번호가 다르면, flash 메시지로 비밀번호가 일치 하지 않습니다. redirect_to :back
        flash[:alert] = "비밀번호가 일치 하지 않습니다."
        redirect_to :back
      end
      else
      # 1-2. 이미 가입된 이메일, flash 메세지로 가입된 이메일입니다.
      flash[:alert] = "이미 가입된 이메일입니다."
      redirect_to :back
    end
  end

  def Posts
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def login

  end

  def loginprocess
    # 1.이메일 가입되었는지 확인
    user = User.find_by(email: params[:email])
    # 1.1. 가입이 되었으면, 비밀번호 확인
    if user
      if(user.authenticate(params[:password]))
    # 1.1.1 비밀번호가 일치하면 -> 로그인
        session[:user_id] = user.id
        flash[:notice] = "#{user.username}님 어서오세요. 꽤 보고 싶었다구요~~"
        redirect_to "/"
    # 1.1.2 비밀번호가 다르면 -> flash
      else
        flash[:alert] = "비밀번호가 다릅니다."
        redirect_to :back
      end
    # 1.2 가입이 안되있으면 -> flash + 가입되어 있는 곳으로
    else
    flash[:alert] = "가입되어 있지 않은 이메일 입니다."
    redirect_to :back
    end
  end

  def logout
    session.clear
    flash[:notice] = "로그아웃 되셨습니다."
    redirect_to '/'
  end
end
