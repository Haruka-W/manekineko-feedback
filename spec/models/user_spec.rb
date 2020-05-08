require 'rails_helper'

RSpec.describe 'Userモデルのテスト', type: :model do

	describe 'ユーザー登録成功' do
		it '全部入力されていれば有効' do
			user = User.new(
				email: 'test@co.jp',
				password: '123456',
				name: "テスト太郎",
				handle_name: "テストユーザー",
				prefecture: 5
			)
			expect(user).to be_valid
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

	describe 'バリデーションのテスト' do
		let(:user) { build(:user) }
    	subject { test_user.valid? }
    	context 'nameカラム' do
      		let(:test_user) { user }
      		it '空欄でないこと' do
        		test_user.name = ''
        		is_expected.to eq false;
      		end
      		it '2文字以上であること' do
        		test_user.name = Faker::Lorem.characters(number:1)
        		is_expected.to eq false;
      		end
      		it '20文字以下であること' do
        		test_user.name = Faker::Lorem.characters(number:21)
        		is_expected.to eq false;
      		end
      	end
      	context 'profileカラム' do
      		let(:test_user) { user }
      		it '200文字以下であること' do
        		test_user.profile = Faker::Lorem.characters(number:201)
        		is_expected.to eq false
      		end
      	end
    end

end
