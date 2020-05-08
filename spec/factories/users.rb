FactoryBot.define do
  factory :user do
    email {"test@user"}
    password {"123456"}
    name {"テスト太郎"}
	handle_name {"テストユーザー"}
  end
end
