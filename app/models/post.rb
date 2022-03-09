class Post < ActiveRecord::Base
  belongs_to :author, class_name: 'User', foreign_key: :user_id
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }

  def five_last_comments
    comments.order('created_at Desc').limit(5)
  end

  after_save :update_posts_counter

  def liked?(user)
    !!likes.find { |like| like.user_id == user.id }
  end

  def update_posts_counter
    author.increment!(:posts_counter)
  end
end
