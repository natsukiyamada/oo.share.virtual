class UnknownUsersController < ApplicationController
  skip_before_action :login_required

  def create
  	@event = Event.find_by(event_code: unknown_users_params[:event_code])
  
    if @event.present?
      @user = @event.user
      
      unless signed_in?
        user = UnknownUser.new(unknown_users_params[:id])
        session[:user_id] = user.id
      end
      redirect_to user_event_path(@user, @event)
      
    else
      flash.notice = "コードに該当するイベントが見つかりませんでした"
      redirect_to root_url
    end
    
  end

  def destroy
  end

  private

  def unknown_users_params
    params.require(:unknown_user).permit(:id, :event_code)  
  end
end
