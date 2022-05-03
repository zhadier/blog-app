class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  after_create :update_posts_counter

  after_destroy do
    author.decrement!(:posts_counter)
  end

  private
  def update_posts_counter
    author.increment!(:posts_counter)
  end
end
