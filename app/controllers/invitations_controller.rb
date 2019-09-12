class InvitationsController < ApplicationController
  def new
  	@user = current_user
    @event =Event.new
  end

  
  def create
    @event = Event.find_by(event_code: invitation_params[:event_code])
    
    if  @event.present? 
       @user = @event.user
       redirect_to user_event_path(@user, @event)
    else
        flash.notice = "イベントがありません"
        @user = current_user
        redirect_to user_path(@user)
    end
  end

  private

  def invitation_params
  	params.require(:invitation).permit(:event_code)
  end
end
