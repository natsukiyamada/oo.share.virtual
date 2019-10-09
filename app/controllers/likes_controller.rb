class LikesController < ApplicationController
  #↓うまいこといかんから後でなおす
  #before_action :get_path_to_event_show, only: [:create, :destroy]
  
  def create
    like = current_user.likes.build(comment_id: params[:comment_id])
    
    if params[:comment_id].present? 
      @comment = Comment.find_by(id: params[:comment_id])
      event = @comment.event
      user = event.user
    end
    
    respond_to do |format|  
      if like.save
        format.js { render :create}
      else
        flash.alert = "いいねに失敗しました"
        format.html {redirect_to user_event_path(user, event)}
      end
    end
  end

  def destroy
    if session[:unknown_user_id] == current_user.id
  	  like = Like.find_by(comment_id: params[:comment_id], unknown_user_id: current_user.id)
  	else
  	  like = Like.find_by(comment_id: params[:comment_id], user_id: current_user.id)
  	end 
    
    @comment = Comment.find_by(id: params[:comment_id])
    event = @comment.event
    user = event.user
    
    respond_to do |format|
    
      if like.destroy
        format.js {render :destroy}
      else
        flash.alert = "いいねに失敗しました"
        format.html {redirect_to user_event_path(user, event)}
      end
    end
  end
  
  private
  
  def get_path_to_event_show
    comment = Comment.find_by(id: params[:comment_id])
    event = comment.event
    user = event.user
  end
end
