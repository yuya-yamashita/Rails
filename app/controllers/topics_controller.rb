class TopicsController < ApplicationController
  def new
    @topic = Topic.new
  end

  def create
  if current_user.topics.create(topic_params)
    redirect_to topics_path, notice: '投稿に成功しました'
  else
    flash.now[:alert] = "投稿に失敗しました"
    render :new
  end
end

  def index
    @topics = Topic.all
    @comments = Comment.find_by(topic_id: params[:topic_id])
    @comments = Comment.all
  end

private
def topic_params
  params.require(:topic).permit(:image, :description)
end
end
