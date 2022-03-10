require 'rails_helper'

RSpec.describe 'Login', type: :feature do
  describe 'login' do
    before(:each) do
      @user = User.create! name: 'User', photo: 'photo.png', password: '123456',
                           email: 'user@email.com', confirmed_at: Time.now
      @user2 = User.create! name: 'User2', photo: 'photo.png', password: '123456',
                            email: 'user2@email.com', confirmed_at: Time.now

      visit new_user_session_path
      fill_in 'Email', with: 'user@email.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'

      @post1 = @user.posts.create!(title: 'Post1', text: 'description', comments_counter: 0, likes_counter: 0,
                                   created_at: Time.now)
      @comment = @post1.comments.create!(text: 'comment1', user_id: @user.id)
      @comment2 = @post1.comments.create!(text: 'comment2', user_id: @user2.id)

      @like = @post1.likes.create!(user_id: @user.id)
      click_on 'User'
      click_link 'Post1'
    end

    scenario 'I can see the posts title.' do
      expect(page).to have_content('Post1')
    end

    scenario 'I can see who wrote the post.' do
      expect(page).to have_content('User')
    end

    scenario 'I can see how many comments it has.' do
      expect(page).to have_content('Comments: 2')
    end

    scenario 'I can see how many likes it has.' do
      expect(page).to have_content('Likes: 1')
    end

    scenario 'I can see the post body.' do
      expect(page).to have_content('description')
    end

    scenario 'I can see the username of each commentor.' do
      expect(page).to have_content('User: comment1')
    end

    scenario 'I can see the comment each commentor left.' do
      expect(page).to have_content('comment2')
    end
  end
end
