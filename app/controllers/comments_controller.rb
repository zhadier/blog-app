class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @user = User.find(params[:user_id])
    respond_to do |format|
      format.html do
        values = params.require(:comment).permit(:text)
        @new_comment = Comment.new(post: @post, author: @user, text: values[:text])
        if @new_comment.save
          flash.now[:success] = 'Comment was saved'
        else
          flash.now[:error] = 'Failed to add comment'
        end
        redirect_to user_post_url(id: params[:post_id])
      end
    end
  end
end
