require "rails_helper"

RSpec.describe "Tagモデルのテスト", type: :model do
  # describe "バリデーションのテスト" do
  #   context "nameカラム" do
  #     it "空でないこと" do
  #       test_user.name = ""
  #       is_expected.to eq false;
  #     end
  #   end
  # end
  describe "アソシエーションのテスト" do
    context "postモデルとの関係" do
      it "1:Nとなっている" do
        expect(Tag.reflect_on_association(:posts).macro).to eq :has_many
      end
    end

    context "PostTagモデルとの関係" do
      it "1:Nとなっている" do
        expect(Tag.reflect_on_association(:post_tags).macro).to eq :has_many
      end
    end
  end
end
