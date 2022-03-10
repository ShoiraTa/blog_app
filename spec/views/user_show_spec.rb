require 'rails_helper'

RSpec.describe 'Login', type: :feature do
  describe 'login' do
    before(:each) do
      @user = User.create! name: 'User', photo: 'photo.png', bio: 'User 1 bio', password: '123456',
                           email: 'user@email.com', confirmed_at: Time.now
      @user2 = User.create! name: 'User2', photo: 'photo.png', password: '123456', email: 'user2@email.com',
                            confirmed_at: Time.now

      visit new_user_session_path
      fill_in 'Email', with: 'user@email.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'

      @post1 = @user.posts.create!(title: 'Post1', text: 'description', comments_counter: 0, likes_counter: 0,
                                   created_at: Time.now)
      @post2 = @user.posts.create!(title: 'Post2', text: 'description', comments_counter: 0, likes_counter: 0,
                                   created_at: Time.now)
      @post3 = @user.posts.create!(title: 'Post3', text: 'description', comments_counter: 0, likes_counter: 0,
                                   created_at: Time.now)
      @post4 = @user.posts.create!(title: 'Post4', text: 'description', comments_counter: 0, likes_counter: 0,
                                   created_at: Time.now)

      @comment = @post1.comments.create!(text: 'comment1', user_id: @user.id)
      @comment2 = @post1.comments.create!(text: 'comment2', user_id: @user2.id)

      @like = @post1.likes.create!(user_id: @user.id)
      click_on 'User'
    end
    scenario 'I can see the users profile picture.' do
      page.should have_selector('img')
    end
    scenario 'I can see the number of posts the user has written.' do
      expect(page).to have_content('Number of posts: 4')
    end
    scenario 'I can see the users bio.' do
      expect(page).to have_content('User 1 bio')
    end
    scenario 'I can see the users first 3 posts.' do
      expect(page).to have_content 'Post4'
      expect(page).to have_content 'Post2'
      expect(page).to have_content 'Post3'
    end
    scenario 'I can see a button that lets me view all of a users posts.' do
      expect(page).to have_content('See all posts')
    end

    scenario 'When I click a users post, it redirects me to that posts show page.' do
      click_link 'Post2'
      expect(page).to have_current_path user_post_path(@user, @post2)
    end

    scenario 'When I click to see all posts, it redirects me to the users posts index page.' do
      click_link 'See all posts'
      expect(page).to have_current_path user_posts_path(@user)
    end
  end
end
