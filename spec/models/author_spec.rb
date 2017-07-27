require 'rails_helper'

RSpec.describe Author, type: :model do

  # 有効なファクトリを持つこと
  it "has a valid factory" do
    expect(build(:author)).to be_valid
  end

  context "is valid" do
    # 名前とペンネームとメールがあれば有効な状態
    it "with a name, pen_name and email" do
      author = build(:author,
        name: "Makoto",
        pen_name: "inomar",
        email: "inomar@example.com"
      )
      expect(author).to be_valid
    end
  end

  context "is invalid" do
    # 名前がなければ無効状態
    it "without a name"
    
    # ペンネームがなければ無効
    it "without a pen_name"

    # メールがなければ無効
    it "without a email"

    # パスワードがなければ無効
    it "without a password"

    # 重複したメールアドレスなら無効状態であること
    it "with a suplicate email"
  end

end
