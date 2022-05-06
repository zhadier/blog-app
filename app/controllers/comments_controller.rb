class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @user = current_user
    respond_to do |format|
      format.html do
        values = params.require(:comment).permit(:text)
        @new_comment = Comment.new(post: @post, author: @user, text: values[:text])
        if @new_comment.save
          flash[:success] = 'Comment was saved'
        else
          flash[:error] = 'Failed to add comment'
        end
        redirect_back(fallback_location: root_path)
      end
    end
  end
end
