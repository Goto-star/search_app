require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe 'full_title' do
    let(:base_title) { "Where is Hosp" }

    context '引数を渡した場合' do
      it '引数の文字列とベースタイトルが返ること' do
        expect(full_title('Page Title')).to eq "Page Title | #{base_title}"
      end
    end

    context '引数がなかった場合' do
      it 'ベースタイトルのみが返ること' do
        expect(full_title).to eq base_title.to_s
      end
    end
  end
end
