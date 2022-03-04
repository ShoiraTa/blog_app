require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Comment model' do
    before(:all) do
      user = User.new(name: 'TestUser', posts_counter: 0)
      post = Post.new(title: 'Title', text: 'text test', comments_counter: 1, likes_counter: 0, user_id: 1)
      user.save
      post.save
    end

    subject { Comment.new(text: 'Comment', author: User.find(1), post: Post.first) }
    before { subject.save }

    it 'likes_counter should be integer and text should be present' do
      expect(subject).to be_valid
    end

    it 'Title should be present' do
      subject.text = nil
      expect(subject).to_not be_valid
    end

    it 'Increases the comments_counter' do
      old_comments_counter = Post.find(32).comments_counter
      subject.update_comments_counter
      expect(Post.find(32).comments_counter).to eq(old_comments_counter + 1)
    end
  end
end
