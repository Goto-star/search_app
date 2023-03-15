require 'rails_helper'

RSpec.describe 'Users_Login', type: :request do
  describe '#sign_in' do
    let(:user) { create(:user) }
    let(:guest_user) { build(:guest_user) }

    it 'http通信が成功すること' do
      get new_user_session_path
      expect(response).to have_http_status :success
    end

    context 'ログイン状態の場合' do
      before do
        sign_in user
      end

      it 'ログインした時、ユーザーの詳細ページにアクセスできること' do
        get edit_user_registration_path
        expect(response).to have_http_status :success
      end
    end

    context 'ログイン状態ではない場合' do
      it 'ログインページにリダイレクトされること' do
        get edit_user_registration_path
        expect(response).to redirect_to(user_session_path)
      end
    end

    context 'ゲストログイン状態の場合' do
      before do
        post users_guest_sign_in_path(guest_user)
      end

      it 'post#indexにリダイレクトされること' do
        expect(response).to redirect_to(posts_path)
      end
    end
  end
end
