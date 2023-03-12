require 'rails_helper'

RSpec.describe 'StaticPages', type: :request do
  describe 'root' do
    it '正常にレスポンスを返すこと' do
      get root_path
      expect(response).to have_http_status(200)
    end
  end

  describe '#top' do
    it 'レスポンスが正常に返される' do
      get '/'
      expect(response).to have_http_status(200)
    end

    it 'タイトルが動的に表示される' do
      get '/'
      expect(response.body).to include full_title('Top')
    end
  end

  describe '#about' do
    it 'レスポンスが正常に返される' do
      get '/about'
      expect(response).to have_http_status(200)
    end

    it 'タイトルが動的に表示される' do
      get '/about'
      expect(response.body).to include full_title('About')
    end
  end

  describe '#signup' do
    it 'レスポンスが正常に返される' do
      get '/users/sign_up'
      expect(response).to have_http_status(200)
    end

    it 'タイトルが動的に表示される' do
      get '/users/sign_up'
      expect(response.body).to include full_title('Signup')
    end
  end

  describe '#login' do
    it 'レスポンスが正常に返される' do
      get '/users/sign_in'
      expect(response).to have_http_status(200)
    end

    it 'タイトルが動的に表示される' do
      get '/users/sign_in'
      expect(response.body).to include full_title('Login')
    end
  end
end
