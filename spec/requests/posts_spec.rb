require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:each) do
      get '/users/:user_id/posts'
    end

    it 'http request is successfull' do
      expect(response).to have_http_status(:success)
    end

    it 'renders correct template' do
      expect(response).to render_template(:index)
    end

    it 'renders correct placeholder text' do
      expect(response.body).to include('Posts index page')
    end
  end
end

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:each) do
      get '/users/:user_id/posts/:id'
    end

    it 'http request is successfull' do
      expect(response).to have_http_status(:success)
    end

    it 'renders correct template' do
      expect(response).to render_template(:show)
    end

    it 'renders correct placeholder text' do
      expect(response.body).to include('Posts show page')
    end
  end
end
