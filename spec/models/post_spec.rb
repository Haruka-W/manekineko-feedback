require 'rails_helper'

RSpec.describe Post, type: :model do

	context "データが正しく保存される" do
		before do
			user = FactoryBot.create(:user)
			@post = Post.new
			@post.title = "こんにちは"
			@post.content = "いい天気ですね。"
			@post.user_id = 1
			@post.save
		end
		it "全項目が入力されていたら保存" do
			expect(@post).to be_valid
		end
	end

	context "データが保存されない" do
		before do
			user = FactoryBot.create(:user)
			@post = Post.new
			@post.title = ""
			@post.content = "いい天気ですね。"
			@post.user_id = 1
			@post.save
		end
		it "titleが入力されてないため保存されない" do
			expect(@post).to be_invalid
			expect(@post.errors[:title]).to include("can't be blank")
		end
	end
end