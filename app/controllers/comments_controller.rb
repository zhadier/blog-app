class CommentsController < ApplicationController
  load_and_authorize_resource
  def create
    @post = Post.find(params[:post_id])
    respond_to do |format|
      format.html do
        values = params.require(:comment).permit(:text)
        @new_comment = Comment.new(post: @post, author: current_user, text: values[:text])
        if @new_comment.save
          flash[:success] = 'Comment was saved'
        else
          flash[:error] = 'Failed to add comment'
        end
        redirect_back(fallback_location: root_path)
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:success] = 'Comment was deleted'
    redirect_to user_post_path(params[:user_id], params[:post_id])
  end
end
