class EventsController < ApplicationController
  def new
  	@event = current_user.events.build
  	@user = current_user
  end
  
  def show 
    @user = current_user
    @event =Event.find(params[:id])
    @comments = @event.comments.all.order(created_at: "DESC")
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
  

  def udpate 
    event = Event.find(params[:id])
    event.update!(event_params)
    redirect_to user_event_path(event.user, event)
  end

  private

  def event_params
    params.require(:event).permit(:user_id, :event_code, :name, :content)
  end
end

