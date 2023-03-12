require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { create(:user) }
  let(:post) { build(:post, user_id: user.id) }

  it '有効であること' do
    expect(post).to be_valid
  end

  it 'user_idがない場合は無効であること' do
    post.user_id = nil
    expect(post).to_not be_valid
  end

  it '並び順は投稿の新しい順になっていること' do
    FactoryBot.send(:user_with_posts)
    expect(FactoryBot.create(:most_recent)).to eq Post.first
  end

  it '投稿したユーザが削除された場合、投稿も削除されること' do
    post = FactoryBot.create(:most_recent)
    post_count = -1
    user = post.user
    expect { user.destroy }.to change(Post, :count).by post_count
  end

  describe 'title' do
    it '空なら無効であること' do
      post.title = ' '
      expect(post).to_not be_valid
    end

    it '21文字以上なら無効であること' do
      post.title = 'a' * 21
      expect(post).to_not be_valid
    end
  end

  describe 'place' do
    it '空なら無効であること' do
      post.place = ' '
      expect(post).to_not be_valid
    end

    it '21文字以上なら無効であること' do
      post.place = 'a' * 21
      expect(post).to_not be_valid
    end
  end

  describe 'impression' do
    it '空なら無効であること' do
      post.impression = ' '
      expect(post).to_not be_valid
    end

    it '500文字以上でも無効にならないこと' do
      post.impression = 'a' * 500
      expect(post).to be_valid
    end
  end
end
