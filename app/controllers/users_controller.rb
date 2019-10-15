class UsersController < ApplicationController
	skip_before_action :login_required, only: [:new]

	def new
		@user = User.new
	end

	def create
	    @user = User.new(user_params)
	    if @user.save
          session[:user_id] = @user.id
          flash.notice = "ユーザを登録しました"
	      redirect_to user_path(@user)
	    else
	      flash.now[:alert] = "登録できませんでした"
	      render :new
	    end
	end
    
    def show 
    	@user = User.find_by(id: params[:id])
        @events = @user.events
    end

	def edit
		@user = User.find_by(id: params[:id])
	end
  
	def update
		@user = User.find_by(id: params[:id])
		@user.update!(user_params)

		flash.notice = "ユーザ情報を変更しました"
		redirect_to user_path(@user)
	end
	
	def destroy

	end

private

	def user_params
	      params.require(:user).permit(:name, :mail, :password, :password_confirmation, :id)
	end
end
