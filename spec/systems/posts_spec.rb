require 'rails_helper'

RSpec.describe 'Posts', type: :system do
  before do
    driven_by(:rack_test)
  end

  describe 'Post#index' do
    before do
      FactoryBot.send(:user_with_posts, posts_count: 40)
      @user = Post.first.user
    end

    it '30件表示されていること' do
      visit user_path @user

      posts_wrapper =
        within 'ol.posts' do
          find_all('li')
        end
      expect(posts_wrapper.size).to eq 7
    end

    it 'ページネーションのラッパータグが表示されていること' do
      visit user_path @user
      expect(page).to have_selector '.pagination'
    end

    it 'ページネーションの表示が1箇所のみであること' do
      visit user_path @user
      pagination = find_all('.pagination')
      expect(pagination.size).to eq 2
    end

    it '投稿のタイトルがページ内に表示されていること' do
      visit user_path @user
      @user.posts.each do |post|
        expect(page).to have_content post.title
      end
    end
  end

  describe 'home' do
    before do
      FactoryBot.send(:user_with_posts, posts_count: 35)
      @user = Post.first.user
      sign_in @user
      visit posts_path
    end

    it 'ページネーションのラッパータグがあること' do
      expect(page).to have_selector '.pagination'
    end

    context '有効な送信の場合' do
      it '投稿されること' do
        visit new_post_path
        fill_in 'タイトル:', with: 'test title'
        fill_in '病院名:', with: 'テスト病院'
        fill_in '感想:', with: 'very good'
        expect { click_button '投稿する' }.to change(Post, :count).by 1

        expect(page).to have_content '投稿しました'
      end
    end

    context '無効な送信の場合' do
      it 'タイトルが空なら投稿されないこと' do
        visit new_post_path
        fill_in 'タイトル:', with: ''
        fill_in '病院名:', with: 'テスト病院'
        fill_in '感想:', with: 'very good'
        expect { click_button '投稿する' }.to_not change(Post, :count)

        expect(page).to have_selector 'div.flash_alert'
      end

      it '病院名が空なら投稿されないこと' do
        visit new_post_path
        fill_in 'タイトル:', with: 'test title'
        fill_in '病院名:', with: ''
        fill_in '感想:', with: 'very good'
        expect { click_button '投稿する' }.to_not change(Post, :count)

        expect(page).to have_selector 'div.flash_alert'
      end

      it '感想が空なら投稿されないこと' do
        visit new_post_path
        fill_in 'タイトル:', with: 'test title'
        fill_in '病院名:', with: 'テスト病院'
        fill_in '感想:', with: ''
        expect { click_button '投稿する' }.to_not change(Post, :count)

        expect(page).to have_selector 'div.flash_alert'
      end
    end
  end
end
