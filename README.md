# Where's Hosp

病院検索に特化したアプリケーションです。<br>
半径1km内の医療施設を探索でき、評価情報も記載されています。<br>
また口コミ機能も搭載しているため、実際に病院に訪れた人の感想をリアルタイムで見ることができます。<br>
![Uploading image.png…](https://user-images.githubusercontent.com/100769306/226295254-ef4b18e5-22b7-4552-ae11-6a77d7321888.png)
![Uploading image.png…](https://user-images.githubusercontent.com/100769306/226304310-19e8464f-4457-4bac-a474-491ecf9e9cbf.png)
![Uploading image.png…](https://user-images.githubusercontent.com/100769306/226304615-ef3d1192-7de8-41b7-b66a-6b93f6852400.png)

## URL

https://wherehosp.com
画面上部のゲストログインボタンから、メールアドレスとパスワードを入力せずにログインできます。ゲストログインの場合投稿機能は制限されます。

## 使用技術

- HTML&CSS
- Bootstrap
- Ruby 2.7.3
- Ruby on Rails 6.0.0
- JavaScript
- MySQL 6.3
- Nginx
- Unicorns 
- AWS
    - VPC
    - EC2
    - RDS
    - Route53
    - ACM
    - ALB
- Capistrano3
- Rspec
- Rubocop
- Google map App

## インフラ構成図

![Uploading image.png…](https://user-images.githubusercontent.com/100769306/226305966-f7a39ea6-da29-4bac-8189-a81a5a49d58a.png)

## 機能一覧

- ユーザー登録、ログイン機能(devise)
- 口コミ機能
- 画像投稿(Carrierwave)
- 位置情報検索機能(geocoder)
- いいね機能(Ajax)
- コメント機能
- ページネーション機能(kaminari)
- 検索機能(ransack)

## テスト
- RSpec
  - 単体テスト(model)
  - 機能テスト(request)
  - 統合テスト(system)
