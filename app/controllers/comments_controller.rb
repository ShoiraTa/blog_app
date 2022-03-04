class CommentsController < ApplicationController
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

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
