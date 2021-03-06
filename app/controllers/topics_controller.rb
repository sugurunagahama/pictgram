class TopicsController < ApplicationController
  def index
     @topics = Topic.all.includes(:favorite_users)
  end
  
  def new
    @topic = Topic.new
  end

  def show
    @topic = Topic.find(params[:id])
    @comments = @topic.comments
    @comment = Comment.new
  end
  
  def create
    @topic = current_user.topics.new(topic_params)
    #binding.pry

    if @topic.save
      redirect_to topics_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end
  
  def logged_in?
   !current_user.nil?
  end
   
   helper_method:current_user,:logged_in?
   
   

  private
  def topic_params
    params.require(:topic).permit(:image, :description)
  end
end

