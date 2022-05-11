require 'rails_helper'

RSpec.describe 'Login_page', type: :feature do
  before(:each) do
    visit new_user_session_path
  end

  it 'has inputs and a submit button' do
    expect(page).to have_content('Email')
    expect(page).to have_content('Password')
    expect(page).to have_button('Log in')
  end

  it 'gives error if submit button pressed without input' do
    click_button('Log in')
    expect(page).to have_content('Invalid Email or password.')
  end

  it 'gives error if submit button pressed with wrong input data' do
    fill_in 'Email', with: 'Piero@gmail.com'
    fill_in 'Password', with: 'Incorrect'
    click_button('Log in')
    expect(page).to have_content('Invalid Email or password.')
  end

  it 'takes to root page when submitted with correct input' do
    fill_in 'Email', with: 'tom@gmail.com'
    fill_in 'Password', with: 'tom12345'
    click_button('Log in')
    expect(page).to have_content('Signed in successfully.')
    expect(current_path).to eql(root_path)
  end
end
