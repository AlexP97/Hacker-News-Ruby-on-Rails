class CommentsController < ApplicationController

  def upvote
    set_comment
    @comment.liked_by current_user
    redirect_back fallback_location: root_path
  end
  
  def unvote
    set_comment
    @comment.unliked_by current_user
    redirect_back fallback_location: root_path
  end
  
  def index
    @comments = Comment.all
    respond_to do |format|
      format.json { render json: @comments }
    end
  end

  def create
    micropost = Micropost.find(params[:id])
    comment = micropost.comments.build(comment_params)
    if current_user 
      comment.user_id = current_user.id
    end
    
      if comment.save
        flash[:notice] = "Comment has been created."
        redirect_to micropost
      else
        flash[:alert] = "Comment has not been created."
        redirect_to micropost
      end
  end
  
  def createb
    commentOrigin = Comment.find(params[:id])
    reply = commentOrigin.comments.build(comment_params)
    reply.user_id = current_user.id

    if reply.save
      flash[:notice] = "Reply has been created."
      redirect_to "/microposts/"+ commentOrigin.commentable_id.to_s
    else
      flash[:alert] = "Reply has not been created."
    end
  end
  
  def show
    @comment = Comment.find(params[:id])
  end
  
  def destroy
    set_comment
    if @comment.destroy
      flash[:notice] = "Comment has been deleted."
      redirect_to request.referrer
    else
      flash[:alert] = "Comment has not been deleted."
      redirect_to root_path
    end
  end

  private    
    def set_comment
      @comment = Comment.find(params[:id])
    end
    def comment_params
      params.permit(:comment)
    end
end