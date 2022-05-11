class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }

  before_create do
    self.likes_counter = 0
    self.comments_counter = 0
    update_posts_counter
  end

  after_destroy do
    author.decrement!(:posts_counter)
  end

  def recent_comments
    comments.includes(:author, :post).order(created_at: :desc).limit(5)
  end

  def liked?(user_id)
    likes.find { |like| like.author_id == user_id }
  end

  private

  def update_posts_counter
    author.increment!(:posts_counter)
  end
end
