class UsersController < ApplicationController
    skip_before_action :login_required 

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
		
	end

	def update
		
	end

	def destroy

	end

private

	def user_params
	      params.require(:user).permit(:name, :mail, :password, :password_confirmation, :id)
	end
end
