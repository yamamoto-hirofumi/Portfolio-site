# require 'rails_helper'

# RSpec.describe "Favoriteに関するテスト", type: :request do
#   let(:user) { create(:user) }
#   let!(:post) { create(:post, user: user) }
#   before do
#     # user = FactoryBot.create(:user)
#     # visit post_path(post)
#   end
#   context 'いいねをクリックした場合', js: true do
#     it 'いいねできる' do
#       sign_in(user)
#       visit post_path(post)
#       find('.favorite-btn').click
#       # expect(page).to have_selector "#favorie-btn"
#       expect(post.favorites.count).to eq(1)
#     end
#     it "いいね解除できる" do
#       find('.nofavoriting-btn').click
#       expect(page).to have_selector "#nofavorite-btn"
#       expect(post.favorites.count).to eq(0)
#     end
#   end
# end
