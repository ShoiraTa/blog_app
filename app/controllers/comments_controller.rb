class CommentsController < ApplicationController
  load_and_authorize_resource
  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = @post.id
    if @comment.save
      flash[:success] = 'Comment was created'
      redirect_to "/users/#{@post.user_id}/posts/#{@post.id}"
    else
      redirect_to "/users/#{@post.user_id}/posts/#{@post.id}"
      flash[:danger] = 'Comment was not created, please fill in all fields'
    end
  end

  def destroy
    @comment = Comment.find(params[:comment_id])
    @post = Post.find(@comment.post_id)
    @post.comments_counter -= 1
    @comment.destroy!
    @post.save
    flash[:success] = 'You have deleted this comment successfully!'
    redirect_to user_post_path(current_user.id, @comment.post_id)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
