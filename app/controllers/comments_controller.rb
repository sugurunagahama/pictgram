class CommentsController < ApplicationController
 
  def new
    @comment = Comment.new
    @topic_id = params[:topic_id]
  end

  def create #コメントを登録する
    
    @comment = current_user.comments.new(comment_params)
    
   #binding.pry
    if @comment.save #コメント登録の条件分岐
      redirect_to topics_path, success: 'コメントに成功しました' 
    else
      flash.now[:danger] = "コメントに失敗しました"
      render :new
    end
  end
  private
  def comment_params
    params.require(:comment).permit(:content, :topic_id)
  end
end