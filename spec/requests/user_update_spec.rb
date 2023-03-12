require 'rails_helper'

RSpec.describe 'Users_Update', type: :request do
  describe 'registrations#update' do
    let(:user) { create(:user) }
    let(:other_user) { create(:user) }

    before do
      sign_in user
    end

    it 'タイトルがSetting | Where is Hospであること' do
      get edit_user_registration_path(user)
      expect(response.body).to include full_title('Setting')
    end

    context '有効な値の場合' do
      before do
        @name = 'Example User'
        @email = 'user@example.com'
        @password = 'password'
        patch user_registration_path, params: { user: { name: @name,
                                                        email: @email,
                                                        current_password: @password } }
      end

      it '更新できること' do
        user.reload
        expect(user.name).to eq @name
        expect(user.email).to eq @email
      end

      it 'Post#indexにリダイレクトすること' do
        expect(response).to redirect_to posts_path
      end

      it 'flashが表示されていること' do
        expect(flash).to be_any
      end
    end

    context '無効な値の場合' do
      it '更新できないこと' do
        patch user_registration_path, params: { user: { name: '',
                                                        email: 'foo@invlid',
                                                        password: 'foo',
                                                        assword_confirmation: 'bar' } }
        user.reload
        expect(user.name).to_not eq ''
        expect(user.email).to_not eq ''
        expect(user.password).to_not eq 'foo'
        expect(user.password_confirmation).to_not eq 'bar'
      end

      it '更新後にeditのページが表示されていること' do
        get edit_user_registration_path(user)
        patch user_registration_path, params: { user: { name: '',
                                                        email: 'foo@invlid',
                                                        password: 'foo',
                                                        password_confirmation: 'bar' } }
        expect(response.body).to include full_title('Setting')
      end
    end
  end
end
