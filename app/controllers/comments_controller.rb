class CommentsController < ApplicationController
  def index
    @comments = Comment.new
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    # comment.topic_id = params[:comment][:topic_id]
    # comment.comment_body = params[:comment][:comment_body]

    if @comment.save
      redirect_to topics_path, notice: 'コメントの登録に成功しました'
    else
      redirect_to comments_new_path, alert: 'コメントの登録に失敗しました'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:topic_id, :comment_body)
  end
end
