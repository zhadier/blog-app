class PostsController < ApplicationController
  load_and_authorize_resource
  before_action :current_user

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:author, :comments, :likes).order(created_at: :desc)
  end

  def show
    @post_current = Post.find(params[:id])
  end

  def new
    @post_current = Post.new
    respond_to do |format|
      format.html { render :new }
    end
  end

  def create
    @new_post = @current_user.posts.new(post_params)
    @new_post.likes_counter = 0
    @new_post.comments_counter = 0
    respond_to do |format|
      format.html do
        if @new_post.save
          flash[:success] = 'Post was saved'
          redirect_to user_post_path(user_id: @current_user.id, id: @new_post.id)
        else
          flash[:error] = 'Error: Unable to create post'
          redirect_to new_user_post_path
        end
      end
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    flash[:success] = 'Post was deleted'
    redirect_to user_posts_path(post.author.id)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
