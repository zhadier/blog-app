require 'rails_helper'

RSpec.describe 'Users Index Page', type: :feature do
  before(:each) do
    visit users_path
  end

  it 'has users' do
    users = User.all
    users.each { |user| expect(page).to have_content(user.name) }
  end

  it 'has images' do
    expect(page).to have_css('img')
  end

  it 'displays number of posts' do
    user = User.take
    expect(page).to have_content("Number of Posts: #{user.posts_counter}")
  end

  it 'redirects when you click on the name of the user' do
    user = User.take
    click_link(user.name)
    expect(current_path).to eql(user_path(user.id))
  end
end
