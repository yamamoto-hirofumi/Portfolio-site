require 'rails_helper'

RSpec.describe FavoritesController, type: :request do
    let(:user) { create(:user) }
    let(:posts) { create(:post) }
    let(:favorite) { create(:favorite) }

  describe "createのテスト" do
    before do
      sign_in(user)
    end

    it "Ajexが反応する" do
      post post_favorites_path(posts.id), xhr: true
      expect(response.content_type).to eq 'text/javascript'
    end

    it "いいねに成功する" do
      expect { post post_favorites_path(posts.id), xhr: true, params: { post_id: posts.id, favorite_id: favorite.id } }.to change(Favorite, :count).by(1)
    end
  end


  describe "destroyのテスト" do
    before do
      sign_in(user)
    end
    it "Ajexが反応する" do
      delete post_favorites_path(posts.id), xhr: true
      expect(response.content_type).to eq 'text/javascript'
    end
    it "いいね解除" do
      favorite = create(:favorite)
      expect { delete post_favorites_path(posts.id), xhr: true, params: { post_id: posts.id, favorite_id: favorite.id } }.to change(Favorite, :count).by(0)
    end
  end
end