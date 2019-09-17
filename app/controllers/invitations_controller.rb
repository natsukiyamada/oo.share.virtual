class InvitationsController < ApplicationController
  def new
  	@user = current_user
    @event =Event.new
  end

  
  def create
    event = Event.find_by(event_code: invitation_params[:event_code])
    
    unless event.nil?
       user = event.user
       
       if user == current_user
         redirect_to user_event_path(user, event)
       else
         reset_session
         
         unknown_user = UnknownUser.new
         unknown_user.save
         session[:unknown_user_id] = unknown_user.id
         redirect_to user_event_path(event.user, event)
       end
       
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
