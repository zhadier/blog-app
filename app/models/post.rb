class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments

  after_create do
    update(likes_counter: 0)
    update(comments_counter: 0)
    update_posts_counter
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def liked?(user)
    likes.find { |like| like.user_id == user.id }
  end

  after_destroy do
    author.decrement!(:posts_counter)
  end

  private

  def update_posts_counter
    author.increment!(:posts_counter)
  end
end
