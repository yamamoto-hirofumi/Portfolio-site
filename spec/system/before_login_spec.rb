require "rails_helper"

RSpec.describe "ログイン前のテスト", type: :request do
  describe "トップ画面のテスト" do
   before do
     visit root_path
    end
      
    context "表示内容の確認" do
      it "URLが正しい" do
        expect(current_path).to eq "/"
      end
      it 'タイトルが表示されている' do
        expect(page).to have_content 'Make enjoy life'
      end
      it "トップページへのリンクが表示されている" do
        expect(page).to have_link "トップページ"
      end
      # it "サイト紹介のリンクが表示されている" do
      # end
      # it "新規登録のリンクが表示されている" do
      # end
      # it "ログインのリンクが表示されている" do
      # end
      # it "" do
      # end
      
    context "リンクの確認" do 
      it "トップページへのリンク先が正しい" do
        expect(page).to have_link "トップページ", href: root_path
      end
      # it "サイト紹介のリンク先が正しいる" do
      # end
      # it "新規登録のリンク先が正しい" do
      # end
      # it "ログインのリンク先が正しい" do
      # end
    end
    
    end
  end
end