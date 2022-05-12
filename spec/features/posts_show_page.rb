require 'rails_helper'

RSpec.describe 'Post Show Page', type: :feature do
  before(:all) do
    @user = User.find(3)
    @post = @user.posts.take
  end

  before(:each) do
    visit user_post_path(@user.id, @post.id)
  end

  it 'has the name of the user' do
    expect(page).to have_content("by #{@user.name}")
  end

  it 'displays the posts title' do
    expect(page).to have_content(@post.title)
  end

  it 'displays body for the post' do
    expect(page).to have_content(@post.text)
  end

  it 'displays the number of comments' do
    expect(page).to have_content("Comments: #{@post.comments_counter}")
  end

  it 'displays the number of likes' do
    expect(page).to have_content("Likes: #{@post.likes_counter}")
  end

  it 'displays the username and comment of each commentor' do
    @post.comments.includes(:author).each do |comment|
      expect(page).to have_content("#{comment.author.name}: #{comment.text}")
    end
  end
end
