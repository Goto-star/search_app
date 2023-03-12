require 'rails_helper'

RSpec.describe 'Login', type: :system do
  before do
    driven_by(:rack_test)
  end

  describe 'sessions#new' do
    context '有効な値の場合' do
      let(:user) { create(:user) }

      it 'ログインユーザー用ページが表示されること' do
        visit new_user_session_path

        fill_in 'メールアドレス', with: user.email
        fill_in 'パスワード', with: user.password
        click_button 'ログイン'

        expect(page).to_not have_selector "a[href=\"#{new_user_session_path}\"]"
        expect(page).to have_selector "a[href=\"#{destroy_user_session_path}\"]"
        expect(page).to have_selector "a[href=\"#{user_path(user)}\"]"
        expect(page).to have_selector "a[href=\"#{edit_user_registration_path}\"]"
      end
    end

    context '無効な値の場合' do
      it 'flashメッセージが表示される' do
        visit new_user_session_path

        fill_in 'メールアドレス', with: ''
        fill_in 'パスワード', with: ''
        click_button 'ログイン'

        expect(page).to have_selector 'div.flash_alert'
      end
    end
  end
end
