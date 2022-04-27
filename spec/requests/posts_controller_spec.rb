require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  context 'GET #index' do
    before(:example) { get user_posts_path(1) }  # get(:index)
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template(:index)
    end

    it 'does not render a different template' do
      expect(response).to_not render_template(:show)
    end

    it 'has correct placeholder text' do
      expect(response.body).to include('Inside posts index')
    end
  end

  context 'GET #show' do
    before(:example) { get user_post_path(user_id: 1, id: 2)} # get(:show)
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template(:show)
    end

    it 'does not render a different template' do
      expect(response).to_not render_template(:index)
    end

    it 'has correct placeholder text' do
      expect(response.body).to include('Inside posts show')
    end
  end
end
