class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :comments, foreign_key: :user_id
  has_many :posts, foreign_key: :user_id
  has_many :likes, foreign_key: :user_id

  after_create :generate_api_token

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }

  def three_recent_post
    posts.order('created_at Desc').limit(3)
  end

  def admin?
    :role == 'admin'
  end

  private

  def generate_api_token
    self.api_token = Devise.friendly_token
    save
  end
end
