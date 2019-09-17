class UnknownUsersController < ApplicationController
  skip_before_action :login_required

  def create
    @event = Event.find_by(event_code: unknown_users_params[:event_code])
  
    if @event.present?
      
      reset_session if signed_in?

      unknown_user = UnknownUser.new(unknown_users_params[:id])
      unknown_user.save
      session[:unknown_user_id] = unknown_user.id

      @user = @event.user
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
