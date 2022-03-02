class Comment < ActiveRecord::Base
  belongs_to :author, class_name: 'User', foreign_key: :user_id
  belongs_to :post

  after_save :update_comments_counter

  private

  def update_comments_counter
    post.increment!(:comments_counter)
  end
end
