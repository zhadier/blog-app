class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post
  validates :text, presence: true

  after_create :update_comments_counter

  after_destroy do
    post.decrement!(:comments_counter)
  end

  private

  def update_comments_counter
    post.increment!(:comments_counter)
  end
end
