require 'rails_helper'

RSpec.describe 'StaticPages', type: :system do
  before do
    driven_by(:rack_test)
  end

  describe 'root' do
    it 'root_pathへのリンクが2つ、help, about, contactへのリンクが表示されていること' do
      visit root_path
      link_to_root = page.find_all("a[href=\"#{root_path}\"]")

      expect(link_to_root.size).to eq 1
      expect(page).to have_link 'about', href: about_path
      expect(page).to have_link 'login', href: new_user_session_path
      expect(page).to have_link 'sign up', href: new_user_registration_path
    end
  end
end
