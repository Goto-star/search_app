require 'rails_helper'

RSpec.describe 'Users_Login', type: :request do
  describe '#sign_in' do
    let(:user) { create(:user) }

    it 'http通信が成功すること' do
      get new_user_session_path
      expect(response).to have_http_status :success
    end

    context 'ログイン状態の場合' do
      before do
        sign_in user
      end

      it 'ログインした時、ユーザーの詳細ページにアクセスできる' do
        get edit_user_registration_path
        expect(response).to have_http_status :success
      end
    end

    context 'ログイン状態ではない場合' do
      it 'ログインページにリダイレクトされる' do
        get edit_user_registration_path
        expect(response).to redirect_to(user_session_path)
      end
    end
  end
end
