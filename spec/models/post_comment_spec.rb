require "rails_helper"

RSpec.describe "PostCommentモデルのテスト", type: :model do
  let(:post_comment) { FactoryBot.create(:post_comment) }

  describe "バリデーションのテスト" do
    context "commentカラム" do
      it "コメント入力済みなら有効" do
        expect(post_comment).to be_valid
      end
      it "空でないこと" do
        post_comment.comment = ""
        expect(post_comment).to be_invalid
      end
    end
  end

  describe "アソシエーションのテスト" do
    context "Postモデルとの関係" do
      it "N:1となっている" do
        expect(PostComment.reflect_on_association(:post).macro).to eq :belongs_to
      end
    end

    context "Userモデルとの関係" do
      it "N:1となっている" do
        expect(PostComment.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end

    context "Notificationモデルとの関係" do
      it "1:Nとなっている" do
        expect(PostComment.reflect_on_association(:notifications).macro).to eq :has_many
      end
    end
  end
end
