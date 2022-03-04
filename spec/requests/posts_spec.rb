require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:each) do
      @user = User.new(name: 'TestUser', posts_counter: 0)
      @user.save
      get '/users/1/posts'
    end

    it 'http request is successfull' do
      expect(response).to have_http_status(:success)
    end

    it 'renders correct template' do
      expect(response).to render_template(:index)
    end
  end
end

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:each) do
      @user = User.new(name: 'TestUser', posts_counter: 0)
      @post = Post.new(title: 'Title', text: 'text test', comments_counter: 1, likes_counter: 0, user_id: 1)
      @user.save
      @post.save
      get '/users/1/posts/32'
    end

    it 'http request is successfull' do
      puts @post.id
      expect(response).to have_http_status(:success)
    end

    it 'renders correct template' do
      expect(response).to render_template(:show)
    end
  end
end
