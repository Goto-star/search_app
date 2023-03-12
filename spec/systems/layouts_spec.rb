require 'rails_helper'

RSpec.describe 'Layouts', type: :system do
  before do
    driven_by(:rack_test)
  end

  let(:user) { create(:user) }

  describe 'header' do
    context 'ログイン済みの場合' do
      before do
        sign_in user
        visit posts_path
      end

      it 'titleをクリックするとroot_pathに遷移すること' do
        click_link "Where's Hosp"
        expect(page.current_path).to eq posts_path
      end

      it 'profileをクリックするとuser_path(user)に遷移すること' do
        click_link 'profile'
        expect(page.current_path).to eq user_path(user)
      end

      it 'settingをクリックするとnew_user_session_pathに遷移すること' do
        click_link 'setting'
        expect(page.current_path).to eq edit_user_registration_path
      end
    end

    context '未ログインの場合' do
      before do
        visit root_path
      end

      it 'aboutをクリックするとabout_pathに遷移すること' do
        click_link 'about'
        expect(page.current_path).to eq about_path
      end

      it 'loginをクリックするとedit_user_registration_pathに遷移すること' do
        click_link 'login'
        expect(page.current_path).to eq new_user_session_path
      end

      it 'sign upをクリックするとnew_user_registration_pathを遷移すること' do
        click_link 'sign up'
        expect(page.current_path).to eq new_user_registration_path
      end
    end
  end
end
