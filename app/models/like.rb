class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post
  
  after_create :update_likes_counter

  after_destroy do
    post.decrement!(:likes_counter)
  end

  private
  def update_likes_counter
    post.increment!(:likes_counter)
  end
end
