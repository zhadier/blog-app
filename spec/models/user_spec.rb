require 'rails_helper'

RSpec.describe 'User', type: :model do
  context 'User Model' do
    subject { User.new(name: 'Zeeshan', posts_counter: 0, email: 'zhadier@gmail.com', password: 'rooted') }
    before { subject.save }

    it 'User does not have errors if name is not nil and post_counter > 0' do
      expect(subject).to be_valid
    end

    it 'Name should not be nil' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'Posts_counter is greater than or equal to 0' do
      subject.posts_counter = -1
      expect(subject).to_not be_valid
    end

    it 'should return three most recent posts' do
      last_three_posts = []
      (1..10).each do |i|
        post = subject.posts.create(title: "title-#{i}", text: 'text', likes_counter: 0, comments_counter: 0)
        last_three_posts << post if i > 7
      end
      recent_posts = subject.recent_posts
      expect(recent_posts.length).to eq(3)
      expect(recent_posts).to eq(last_three_posts.reverse)
    end
  end
end
