class User < ActiveRecord::Base
  has_many :comments, foreign_key: :user_id
  has_many :posts, foreign_key: :user_id
  has_many :likes, foreign_key: :user_id

  def three_recent_post
    posts.order('created_at Desc').limit(3)
  end
end
