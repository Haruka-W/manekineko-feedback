require 'rails_helper'

RSpec.describe PostsController, type: :controller do

	describe '新規投稿ページ' do
		context '新規投稿ページが表示される' do
			before do
				get :new
			end
			it 'リクエストが200 OKとなる' do
				expect(response.status).to eq 200
			end

			render_views
			it 'ページタイトルが正しく表示される' do
				expect(response.body).to include("新規投稿ページ")
			end
		end
	end

end