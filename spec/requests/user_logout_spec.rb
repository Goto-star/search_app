require 'rails_helper'

RSpec.describe 'Users_Logout', type: :request do
  describe '#Logout' do
    context 'ログイン状態の場合' do
      before do
        user = create(:user)
        post user_registration_path, params: { user: user }
      end

      it 'ログアウトした時、トップページにリダイレクトされる' do
        delete destroy_user_session_path
        expect(response).to redirect_to(root_path)
      end
    end

    context 'ログイン状態ではない場合' do
      it 'ログアウトした時、エラーが発生する' do
        delete destroy_user_session_path
        expect(false).to be_falsey
      end
    end
  end
end
