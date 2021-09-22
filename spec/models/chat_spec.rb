require "rails_helper"

RSpec.describe "Chatモデルのテスト", type: :model do
  describe "アソシエーションのテスト" do
    context "Userモデルとの関係" do
      it "N:1となっている" do
        expect(Chat.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end

    context "Roomモデルとの関係" do
      it "N:1となっている" do
        expect(Chat.reflect_on_association(:room).macro).to eq :belongs_to
      end
    end
  end
end
