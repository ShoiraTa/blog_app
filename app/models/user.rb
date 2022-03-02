class User < ActiveRecord::Base
  has_many :comments, foreign_key: :author_id
  has_many :posts, foreign_key: :author_id
  has_many :likes, foreign_key: :author_id

  private

  def three_recent_post
    posts.order('created_at Desc').limit(3)
  end
end
