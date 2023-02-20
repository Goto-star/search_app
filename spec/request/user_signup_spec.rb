require 'rails_helper'

RSpec.describe 'Users_Signup', type: :request do
  describe '#Signup' do
    context 'メールアドレスが空欄の場合' do
      let! (:user) { build(:user, email: '') }

      it 'ユーザー新規登録の時、リダイレクトされる' do
        put user_registration_path
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
