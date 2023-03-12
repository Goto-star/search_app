require 'rails_helper'

RSpec.describe 'Users_Signup', type: :request do
  describe '#sign_up' do
    let(:user) { create(:user) }
    let(:user_params) { attributes_for(:user) }
    let(:invalid_user_params) { attributes_for(:user, name: "") }

    context '有効な値の場合' do
      it 'リクエストが成功すること' do
        post user_registration_path, params: { user: user_params }
        expect(response.status).to eq 302
      end

      it '登録されること' do
        expect do
          post user_registration_path, params: { user: user_params }
        end.to change(User, :count).by 1
      end

      it 'flashが表示されること' do
        post user_registration_path, params: { user: user_params }
        expect(flash).to be_any
      end
    end

    context '無効な値の場合' do
      it 'リクエストが成功すること' do
        post user_registration_path, params: { user: invalid_user_params }
        expect(response.status).to eq 200
      end

      it '登録されないこと' do
        expect do
          post user_registration_path, params: { user: invalid_user_params }
        end.to_not change(User, :count)
      end
    end
  end
end
