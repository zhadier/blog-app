class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  scope :recent_posts, -> (id) { find(id).posts.order(3, :desc)limit(3) }


end