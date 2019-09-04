class EventsController < ApplicationController
  def new
  	@event = current_user.events.build
  	@user = current_user
  end
  
  def show 
  end

  def create
  	@event = Event.new(event_params)
    @user = current_user	
      if @event.save
	    redirect_to user_path(@user), notice: "イベントを作成しました"
	  else
	    flash.now[:alert] = "イベントの作成に失敗しました"
        render :new
 	  end
  end

  def destroy
    
    @event = Event.find_by(id: params[:id])
    @user = @event.user
    
    flash.notice = "イベントを削除しました" if @event.destroy
  	redirect_to user_path(@user)
  end

  private

  def event_params
    params.require(:event).permit(:user_id, :event_code, :name)
  end

end

