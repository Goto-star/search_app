require 'rails_helper'

RSpec.describe 'StaticPages', type: :system do
  let(:base_title) { "Where's Hosp" }

  describe '#top' do
    it 'レスポンスが正常に返される' do
      get '/'
      expect(response).to have_http_status 200
    end

    it 'タイトルが動的に表示される' do
      get '/'
      expect(response.body).to include "top | #{base_title}"
    end
  end

  describe '#about' do
    it 'レスポンスが正常に返される' do
      get '/about'
      expect(response).to have_http_status 200
    end

    it 'タイトルが動的に表示される' do
      get '/about'
      expect(response.body).to include "about | #{base_title}"
    end
  end
end
