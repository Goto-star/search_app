require 'rails_helper'

RSpec.describe 'Users', type: :system do
  before do
    driven_by(:rack_test)
  end

  describe 'sessions#create' do
    it 'エラーメッセージが表示されること' do
      visit new_user_registration_path
      fill_in '名前', with: ''
      fill_in 'メールアドレス', with: 'user+@invalid'
      fill_in 'パスワード', with: 'aaa'
      fill_in '確認用パスワード', with: 'bbb'
      click_button 'アカウント登録'

      expect(page).to have_selector 'div.flash_alert'
    end
  end
end
