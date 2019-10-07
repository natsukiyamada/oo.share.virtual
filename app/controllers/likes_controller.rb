class LikesController < ApplicationController
  #↓うまいこといかんから後でなおす
  #before_action :get_path_to_event_show, only: [:create, :destroy]
  
  def create
    
    like = current_user.likes.build(comment_id: params[:comment_id])
    comment = Comment.find_by(id: params[:comment_id])
    event = comment.event
    user = event.user
    
    like.save
    redirect_to user_event_path(user, event)
  end

  def destroy
    if session[:unknown_user_id] == current_user.id
  	  like = Like.find_by(comment_id: params[:comment_id], unknown_user_id: current_user.id)
  	else
  	  like = Like.find_by(comment_id: params[:comment_id], user_id: current_user.id)
  	end 
    
    comment = Comment.find_by(id: params[:comment_id])
    event = comment.event
    user = event.user
    like.destroy
    redirect_to  user_event_path(user, event)
  end
  
  private
  
  def get_path_to_event_show
    comment = Comment.find_by(id: params[:comment_id])
    event = comment.event
    user = event.user
  end
end
