require 'rails_helper'

RSpec.describe 'Login', type: :feature do
  describe 'login' do

    before(:each) do
      User.create! name: 'User', photo: 'photo.png', password: '123456', email: 'user@email.com',
                   confirmed_at: Time.now
      visit new_user_session_path
    end

  end
end
