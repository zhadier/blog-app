require 'rails_helper'

RSpec.describe 'Users Show  Page', type: :feature do
  before(:all) do
    @user = User.take
  end

  before(:each) do
    visit user_path(id: @user.id)
  end

  it 'has profile picture' do
    expect(page).to have_css('img')
  end

  it 'has the name of the user' do
    expect(page).to have_content(@user.name)
  end

  it 'displays number of posts' do
    expect(page).to have_content("Number of Posts: #{@user.posts_counter}")
  end

  it 'displays the user bio' do
    expect(page).to have_content(@user.bio)
  end

  it 'displays the users most recent posts' do
    posts = @user.recent_posts
    posts.each { |post| expect(page).to have_content(post.title) }
    count = page.all('div.user-posts').size
    expect(posts.length).to eq(count)
  end

  it 'has link to see all posts' do
    expect(page).to have_link('See all posts')
  end

  it 'takes to root page when submitted with correct input' do
    click_link('See all posts')
    expect(current_path).to eql(user_posts_path(user_id: @user.id))
  end
end
