class UsersController < ApplicationController
    skip_before_action :login_required 

    def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
	    if @user.save
	      redirect_to user_path(@user), notice: "ユーザーの登録が完了しました"
	    else
	      flash.now[:alert] = "ユーザーの登録に失敗しました"
	      render :new
	    end
	end
    
    def show 
    	@user = User.find_by(id: params[:id])
    end

	def edit
		
	end

	def update
		
	end

	def destroy

	end

private

	def user_params
	      params.require(:user).permit(:name, :mail, :password, :password_confirmation)
	end
end
