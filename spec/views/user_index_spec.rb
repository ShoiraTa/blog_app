require 'rails_helper'

RSpec.describe 'Login', type: :feature do
  describe 'login' do

    before(:each) do
      User.create! name: 'User', photo: 'photo.png', password: '123456', email: 'user@email.com',
                   confirmed_at: Time.now
      visit new_user_session_path
    end
    scenario ' I can see the username of all other users.' do
    end
    scenario 'I can see the profile picture for each user.' do
    end
    scenario 'I can see the number of posts each user has written.' do
    end
    scenario 'When I click on a user, I am redirected to that users show page.' do
    end

  end
end
