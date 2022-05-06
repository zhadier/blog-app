class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @user = current_user
    @new_like = Like.new(post: @post, author: @user)
    respond_to do |format|
      format.html do
        if @new_like.save
          flash[:success] = 'Liked Post'
          redirect_back(fallback_location: root_path)
        elsif @post.liked?(@user.id)
          Like.where(author: @user, post: @post).destroy_all
          flash[:success] = 'Unliked Post'
          redirect_back(fallback_location: root_path)
        else
          flash.now[:alert] = 'Error while trying to like post'
        end
      end
    end
  end
end
