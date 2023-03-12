require 'rails_helper'

RSpec.describe 'Post', type: :request do
  describe '#create' do
    context '未ログインの場合' do
      it '口コミが登録されないこと' do
        expect { post posts_path, params: { post: { title: 'example title', place: 'example hosp', impression: 'very good' } } }.to_not change(Post, :count)
      end

      it 'ログインページにリダイレクトされること' do
        post posts_path, params: { post: { title: 'example title' } }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe '#destroy' do
    let(:user) { create(:user) }

    before do
      @post = FactoryBot.create(:most_recent)
    end

    context '他のユーザの投稿を削除した場合' do
      before do
        sign_in user
      end

      it '削除されないこと' do
        expect { delete post_path(@post) }.to_not change(Post, :count)
      end

      it '口コミ一覧ページにリダイレクトされること' do
        delete post_path(@post)
        expect(response).to redirect_to posts_path
      end
    end

    context '未ログインの場合' do
      it '削除されないこと' do
        expect { delete post_path(@post) }.to_not change(Post, :count)
      end

      it 'ログインページにリダイレクトされること' do
        delete post_path(@post)
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
