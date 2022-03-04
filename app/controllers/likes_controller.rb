class LikesController < ApplicationController
  before_action :find_post

  def create
    return if @post.liked?(current_user)

    @post.likes.create(user_id: current_user.id)
    flash[:success] = 'Post was liked'
    redirect_to "/users/#{@post.user_id}/posts/#{@post.id}"
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end
end
