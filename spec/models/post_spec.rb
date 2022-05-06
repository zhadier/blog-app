require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'Post Model' do
    before(:example) do
      @user = User.create(name: 'Zeeshan', posts_counter: 0)
    end

    subject { @user.posts.new(title: 'Post', text: 'Lorem Ipsem', likes_counter: 0, comments_counter: 0) }
    before { subject.save }

    it 'comments_counter and likes_counter take an integer' do
      expect(subject).to be_valid
    end

    it 'comments_counter is not nil' do
      subject.comments_counter = nil
      expect(subject).to_not be_valid
    end

    it 'comments_counter is > 0' do
      subject.comments_counter = -1
      expect(subject).to_not be_valid
    end

    it 'likes_counter is not nil' do
      subject.likes_counter = nil
      expect(subject).to_not be_valid
    end

    it 'likes_counter is > 0' do
      subject.likes_counter = -1
      expect(subject).to_not be_valid
    end

    it 'Title is not nil' do
      subject.title = nil
      expect(subject).to_not be_valid
    end
    it 'should return 5 most recent comments' do
      last_five_comments = []
      (1..10).each do |i|
        comment = subject.comments.create(text: 'text', author: @user)
        last_five_comments << comment if i > 5
      end
      recent_comments = subject.recent_comments
      expect(recent_comments.length).to eq(5)
      expect(recent_comments).to eq(last_five_comments.reverse)
    end
  end
end
