require 'rails_helper'

RSpec.describe 'Login', type: :feature do
  describe 'login' do

    before(:each) do
      User.create! name: 'User', photo: 'photo.png', password: '123456', email: 'user@email.com',
                   confirmed_at: Time.now
                   User.create! name: 'User2', photo: 'photo.png', password: '123456', email: 'user2@email.com',
                   confirmed_at: Time.now
                   fill_in 'Email', with: 'user@email.com'
                   fill_in 'Password', with: '123456'
                   click_button 'Log in'
      visit route_path
    end
    scenario ' I can see the username of all other users.' do
      expect(page).to have_content('User2')
    end
    scenario 'I can see the profile picture for each user.' do
      page.should have_selector('img')
    end

    scenario 'I can see the number of posts each user has written.' do
      expect(page).to have_content('Number of posts: 0')
    end

    scenario 'When I click on a user, I am redirected to that users show page.' do
      click_button 'User' 
      expect(page).to have_current_path user_path(1)
    end

  end
end