class CommentsController < ApplicationController
  load_and_authorize_resource
  def create
    @post = Post.find(params[:post_id])
    @new_comment = Comment.new(comment_params.merge(post_id: @post.id, author_id: current_user.id))
    if @new_comment.save
      flash[:success] = 'Comment was saved'
    else
      flash[:error] = 'Failed to add comment'
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:success] = 'Comment was deleted'
    redirect_to user_post_path(params[:user_id], params[:post_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
