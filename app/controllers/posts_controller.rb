class PostsController < ApplicationController
  load_and_authorize_resource
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
    @current_user = current_user
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end

  def new
    @user = current_user
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.likes_counter = 0
    @post.comments_counter = 0
    @user = current_user
    if @post.save
      flash[:success] = 'Post was saved'
      redirect_to "/users/#{@post.author.id}/posts/"
    else
      render :new
      flash.now[:alert] = 'ERROR. ERROR.'
    end
  end

  def destroy
    post = Post.find(params[:id])
    user = User.find(post.user_id)
    user.posts_counter -= 1
    post.destroy
    user.save
    flash[:success] = 'You have deleted this post successfully!'
    redirect_to user_path(current_user.id)
    authorize! :destroy, @post
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
