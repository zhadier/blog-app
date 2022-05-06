require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'like model' do
    before(:all) do
      @user = User.create(name: 'Zeeshan', posts_counter: 0)
      @post = Post.create(author: @user, title: 'Post', text: 'Lorem Ipsem', comments_counter: 0, likes_counter: 0)
    end

    subject { Like.new(author: @user, post: @post) }
    before { subject.save }

    it 'Like is valid' do
      expect(subject).to be_valid
    end

    it 'likes_counter increases by 1 for a new like' do
      value = @post.likes_counter
      Like.create(author: User.create(name: 'Ali', posts_counter: 0), post: @post)
      expect(@post.likes_counter).to eq(value + 1)
    end
  end
end
