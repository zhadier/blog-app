require 'rails_helper'

RSpec.describe 'Comment', type: :model do
  describe 'Comment Model' do
    before(:example) do
      @user = User.take
      @post = @user.posts.create(title: 'Post', text: 'Lorem Ipsem', comments_counter: 0, likes_counter: 0)
    end

    subject { Comment.new(text: 'Hi', author: User.first, post: Post.first) }
    before { subject.save }

    it 'Comment is valid' do
      expect(subject).to be_valid
    end

    it 'Title is not null' do
      subject.text = nil
      expect(subject).to_not be_valid
    end

    it 'comments_counter increases by 1 for the post commented on' do
      value = Post.first.comments_counter
      Comment.create(text: 'Hi', author: User.first, post: Post.first)
      expect(Post.first.comments_counter).to eq(value + 1)
    end
  end
end
