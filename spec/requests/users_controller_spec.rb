require 'rails_helper'

RSpec.describe 'Users', type: :request do
  context 'GET #index' do
    before(:example) { get users_path } # get(:index)
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
      expect(response.body).to include('post')
    end
  end

  context 'GET #show' do
    before(:example) { get '/users/1' } # get(:show)
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
      expect(response.body).to include('Posts')
    end
  end
end
