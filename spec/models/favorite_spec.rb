require "rails_helper"

RSpec.describe "Favoriteモデルのテスト", type: :model do
  describe "バリデーションのテスト" do
    let(:favorite) { create(:favorite) }

    it "user_idとpost_idがある場合、有効であること" do
      expect(favorite).to be_valid
    end

    it "post_idがない場合、無効であること" do
      favorite.post_id = nil
      expect(favorite).to be_invalid
    end

    it "user_idがない場合、無効であること" do
      favorite.user_id = nil
      expect(favorite).to be_invalid
    end
  end

  describe "アソシエーションのテスト" do
    context "Userモデルとの関係" do
      it "N:1となっている" do
        expect(Favorite.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end

    context "Postモデルとの関係" do
      it "N:1となっている" do
        expect(Favorite.reflect_on_association(:post).macro).to eq :belongs_to
      end
    end
  end
end
