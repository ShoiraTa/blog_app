require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before(:each) do
      get '/users'
    end

    it 'renders correct placeholder text ' do
      expect(response.body).to include('Users index page')
    end

    it 'renders correct template' do
      expect(response).to render_template(:index)
    end

    it "'http request is successfull" do
      expect(response).to have_http_status(:success)
    end
  end
end

RSpec.describe 'Users', type: :request do
  describe 'GET /show' do
    before(:each) do
      get '/users/:id'
    end

    it 'renders correct placeholder text ' do
      expect(response.body).to include('Users show page')
    end

    it 'renders correct template' do
      expect(response).to render_template(:show)
    end

    it "'http request is successfull" do
      expect(response).to have_http_status(:success)
    end
  end
end
