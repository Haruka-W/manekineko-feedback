require 'rails_helper'

RSpec.describe User, type: :model do

	describe 'ユーザー登録成功' do
		it '全部入力されていれば有効' do
			user = User.new(
				email: 'test@co.jp',
				password: '123456',
				name: "テスト太郎",
				handle_name: "テストユーザー",
				prefecture: 5
			)
		end
	end

	describe 'ユーザー登録失敗' do
		it 'メールアドレスが未入力なら無効' do
			user = User.new(email: nil)
			user.valid?
			expect(user.errors[:email]).to include("can't be blank")
		end

		it 'パスワードが未入力なら無効' do
			user = User.new(password: nil)
			user.valid?
			expect(user.errors[:password]).to include("can't be blank")
		end
	end

end
