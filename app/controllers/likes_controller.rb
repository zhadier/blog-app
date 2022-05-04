class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @user = User.find(params[:user_id])
    respond_to do |format|
      format.html do
        @new_like = Like.new(post: @post, author: @user)
        if @new_like.save
          flash.now[:success] = 'Liked'
        else
          Like.where(author: @user, post: @post).delete_all
        end
        redirect_to user_post_url(id: params[:post_id])
      end
    end
  end
end
