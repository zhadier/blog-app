class PostsController < ApplicationController
  before_action :current_user

  def index
    @posts = @user.posts
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
    respond_to do |format|
      format.html do
        values = params.require(:post).permit(:title, :text)
        @new_post = Post.new(author: @user, title: values[:title], text: values[:text])
        if @new_post.save
          flash[:success] = 'Post was saved'
          redirect_to action: :index, user_id: @user.id
        else
          flash.now[:error] = 'Error: Post already liked'
          render :new
        end
      end
    end
  end

  private

  def current_user
    @user = User.find(params[:user_id])
  end
end
