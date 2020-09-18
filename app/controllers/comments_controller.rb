class CommentsController < ApplicationController
  def create
    if !(user_signed_in?)
      redirect_to new_user_session_path and return
    end
    @comment = Comment.new(comment_params)
    if @comment.save
      ActionCable.server.broadcast 'comment_channel', content: @comment
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
