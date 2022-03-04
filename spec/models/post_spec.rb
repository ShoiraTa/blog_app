require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Post model' do
    before(:all) do
      user = User.new(name: 'TestUser', posts_counter: 0)
      user.save
    end

    subject { Post.new(title: 'Title', text: 'text test', comments_counter: 1, likes_counter: 0, user_id: 1) }
    before { subject.save }

    it 'Comments_counter should be integer' do
      expect(subject).to be_valid
    end

    it 'Title should be present' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'Comments_counter should be present' do
      subject.comments_counter = nil
      expect(subject).to_not be_valid
    end

    it 'Increases the comments' do
      old_posts_counter = User.find(1).posts_counter
      subject.update_posts_counter
      expect(User.find(1).posts_counter).to eq(old_posts_counter + 1)
    end
  end
end
