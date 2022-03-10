# require 'rails_helper'

# RSpec.describe 'Users', type: :request do
#   describe 'GET /index' do
#     before(:each) do
#       @user = User.new(name: 'TestUser', posts_counter: 0)
#       @user.save
#       get '/users'
#     end

#     it 'renders correct placeholder text ' do
#       expect(response.bodya).to include('List of all users')
#     end

#     it 'renders correct template' do
#       expect(response).to render_template(:index)
#     end

#     it "'http request is successfull" do
#       expect(response).to have_http_status(:success)
#     end
#   end
# end
# RSpec.describe 'Users', type: :request do
#   describe 'GET /show' do
#     before(:each) do
#       @user = User.new(name: 'TestUser', posts_counter: 0)
#       @user.save
#       get '/users/1'
#     end

#     it 'renders correct placeholder text ' do
#       expect(response.body).to include(@user.name)
#     end

#     it 'renders correct template' do
#       expect(response).to render_template(:show)
#     end

#     it "'http request is successfull" do
#       expect(response).to have_http_status(:success)
#     end
#   end
# end
