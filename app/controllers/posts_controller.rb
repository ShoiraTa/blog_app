class PostsController < ApplicationController
  load_and_authorize_resource
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
    @current_user = current_user.id
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
    @user = current_user
    new_post = current_user.posts.new(params.require(:post).permit(:title, :text))
    new_post.likes_counter = 0
    new_post.comments_counter = 0
    respond_to do |format|
      format.html do
        if new_post.save
          redirect_to "/users/#{new_post.author.id}/posts/", notice: 'Post created successfully'
        else
          render :new, alert: 'Sorry something went wrong'
        end
      end
    end
  end

  # def create
  #   @post = current_user.posts.new(post_params)
  #   @post.likes_counter = 0
  #   @post.comments_counter = 0
  #   @user = current_user
  #   if @post.save
  #     flash[:success] = 'Post was saved'
  #     redirect_to "/users/#{@post.author.id}/posts/"
  #   else
  #     render :index
  #     flash[:alert] = 'ERROR. ERROR.'
  #   end
  # end

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
