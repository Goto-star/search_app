require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }
  let(:duplicate_user) { build(:user) }

  it 'userが有効であること' do
    expect(user).to be_valid
  end

  describe 'sign_in' do
    context '名前の場合' do
      it 'nameが不要であること' do
        user.name = ''
        expect(user).to_not be_valid
      end

      it 'nameは50文字以内であること' do
        user.name = 'a' * 51
        expect(user).to_not be_valid
      end
    end

    context 'メールアドレスの場合' do
      it 'emailが必須であること' do
        user.email = ''
        expect(user).to_not be_valid
      end

      it 'emailは200文字以内であること' do
        user.email = "#{'a' * 189}@example.com"
        expect(user).to_not be_valid
      end

      it '有効な形式のemailは成功すること' do
        valid_addresses = %w[user@exmple.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
        valid_addresses.each do |valid_addresse|
          user.email = valid_addresse
          expect(user).to be_valid
        end
      end

      it '無効な形式のemailは失敗すること' do
        invaild_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar_baz.com]
        invaild_addresses.each do |invalid_addresse|
          user.email = invalid_addresse
          expect(user).to_not be_valid
        end
      end

      it 'emailは重複で登録できないこと' do
        duplicate_user.email = user.email.upcase
        user.save
        expect(duplicate_user).to_not be_valid
      end
    end

    context 'パスワードの場合' do
      it 'passwordが必須であること' do
        user.password = user.password_confirmation = ''
        expect(user).to_not be_valid
      end

      it 'passwordは6文字以上であること' do
        user.password = user.password_confirmation = 'a' * 5
        expect(user).to_not be_valid
      end
    end
  end
end
