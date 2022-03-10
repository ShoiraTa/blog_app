require 'rails_helper'

RSpec.describe 'Login', type: :feature do
  describe 'login' do

    before(:each) do
      User.create! name: 'User', photo: 'photo.png', password: '123456', email: 'user@email.com',
                   confirmed_at: Time.now

    end
    scenario 'endI can see the users profile picture.' do
    end
    scenario 'I can see the number of posts the user has written.' do
    end
    scenario 'I can see the users bio.' do
    end
    scenario 'I can see the users first 3 posts.' do
    end
    scenario 'I can see a button that lets me view all of a users posts.' do
    end
    scenario 'When I click a users post, it redirects me to that posts show page.' do
    end
    scenario 'When I click to see all posts, it redirects me to the users posts index page.' do
    end
  end
end








