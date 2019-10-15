class SessionsController < ApplicationController
  skip_before_action :login_required 
  
  def new
  end

  def create
	user = User.find_by(mail: session_params[:mail])

	 if user&.authenticate(session_params[:password])
	   session[:user_id] = user.id
	   redirect_to user_path(user), notice: '認証に成功しました' 

	else
       flash.notice = "認証に失敗しました"
       redirect_to root_url
     end
  end

  def destroy
	  reset_session
	  redirect_to root_url, notice: 'ログアウトしました'
  end

private

  def session_params
    params.require(:session).permit(:mail, :password)
  end
end
