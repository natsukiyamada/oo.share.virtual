class CommentsController < ApplicationController
  def new
  end

  def create
    @event = Event.find_by(id: params[:event_id])
    @comment = @event.comments.build(comment_params)
    respond_to do |format|    
      if @comment.save
        format.js { render :index }
        flash.notice = "コメントの作成に成功しました"
      else
        format.html { redirect_to user_event_path(@event.user_id, @event) }
        flash.alert = "コメントの作成に失敗しました"
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id]) 
    respond_to do |format|
      if @comment.destroy
        format.js { render :index }
        flash.notice = "コメントの作成に成功しました"
      end 
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:content, :event_id, :user_id)
    end
end
