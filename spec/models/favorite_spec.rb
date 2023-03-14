require 'rails_helper'

RSpec.describe Favorite, type: :model do
  let!(:user) { create(:user) }
  let!(:post) { create(:post, user_id: user.id) }
  let!(:favorite) { create(:favorite, user_id: user.id, post_id: post.id) }

  describe 'いいね機能' do
    context 'いいねができる場合' do
      it 'user_idとpost_idがある時保存できること' do
        expect(favorite).to be_valid
      end

      it 'ユーザーが削除された場合、いいねも削除されること' do
        favorite_count = -1
        user = post.user
        expect { user.destroy }.to change(Favorite, :count).by favorite_count
      end
    end

    context 'いいねができない場合' do
      it "user_idが空の場合、いいねができないこと" do
        favorite.user_id = nil
        favorite.valid?
        expect(favorite.errors.full_messages).to include "Userを入力してください"
      end

      it "post_idが空ではいいねできない" do
        favorite.post_id = nil
        favorite.valid?
        expect(favorite.errors.full_messages).to include "Postを入力してください"
      end
    end
  end
end
