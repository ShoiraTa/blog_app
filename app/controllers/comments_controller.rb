class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = @post.id
    @comment.save
    redirect_to "/users/#{@post.user_id}/posts/#{@post.id}"
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
