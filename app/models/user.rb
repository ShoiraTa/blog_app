class User < ActiveRecord::Base
  has_many :comments, foreign_key: :user_id
  has_many :posts, foreign_key: :user_id
  has_many :likes, foreign_key: :user_id
end