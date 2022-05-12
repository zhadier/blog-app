require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'like model' do
    before(:all) do
      @user = User.first
      @post = @user.posts.take
    end

    subject { Like.new(author: @user, post: @post) }
    before { subject.save }

    it 'Like is valid' do
      expect(subject).to be_valid
    end

    it 'likes_counter increases by 1 for a new like' do
      value = @post.likes_counter
      Like.create(author: User.second, post: @post)
      expect(@post.likes_counter).to eq(value + 1)
    end
  end
end
