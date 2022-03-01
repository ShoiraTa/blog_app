class Post < ActiveRecord::Base
  belongs_to :user
  has_many :likes
  has_many :comments

  def five_last_comments
    comments.order('created_at').limit(5)
  end

  after_save :update_posts_counter

  def update_posts_counter
    user.increment!(:posts_counter)
  end
end
