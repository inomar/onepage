# == Schema Information
#
# Table name: authors
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string(255)
#  pen_name               :string(255)
#  image_id               :string(255)
#  description            :text(65535)
#  other                  :text(65535)
#  social_profile_id      :integer
#

require 'rails_helper'

RSpec.describe Author, type: :model do
  # 有効なファクトリを持つこと
  it 'has a valid factory' do
    expect(build(:author)).to be_valid
  end

  # 有効である状態
  context 'is valid' do
    # 名前とペンネームとメールがあれば有効な状態
    it 'with a name, pen_name and email' do
      author = build(:author,
                     name: 'Makoto',
                     pen_name: 'inomar14',
                     email: 'inomar@example.com')
      expect(author).to be_valid
    end
  end

  # 無効である状態
  context 'is invalid' do
    # 名前がなければ無効状態
    it 'without a name' do
      author = build(:author, name: nil)
      author.valid?
      expect(author.errors[:name]).to include('を入力してください')
    end

    # 名前が最大文字数を越えれば無効
    it 'a name maximum number' do
      max = 50
      author = build(:author, name: 'あ' * (max + 1))
      author.valid?
      expect(author.errors[:name]).to include("は#{max}文字以内で入力してください")
    end

    # ペンネームがなければ無効
    it 'without a pen_name' do
      author = build(:author, pen_name: nil)
      author.valid?
      expect(author.errors[:pen_name]).to include('を入力してください')
    end

    # ペンネームが最大文字数を越えれば無効
    it 'a pen_name maximum number' do
      max = 50
      author = build(:author, pen_name: 'あ' * (max + 1))
      author.valid?
      expect(author.errors[:pen_name]).to include("は#{max}文字以内で入力してください")
    end

    # ペンネームが重複していれば無効
    it 'with a duplicate pen_name' do
      create(:author, pen_name: 'inomar14')
      author = build(:author, pen_name: 'inomar14')
      author.valid?
      expect(author.errors[:pen_name]).to include('はすでに存在します')
    end

    # メールがなければ無効
    it 'without a email' do
      author = build(:author, email: nil)
      author.valid?
      expect(author.errors[:email]).to include('を入力してください')
    end

    # メールが重複していれば無効
    it 'with a duplicate email' do
      create(:author, email: 'inomar@example.com')
      author = build(:author, email: 'inomar@example.com')
      author.valid?
      expect(author.errors[:email]).to include('はすでに存在します')
    end

    # パスワードがなければ無効
    it 'without a password' do
      author = build(:author, password: nil)
      author.valid?
      expect(author.errors[:password]).to include('を入力してください')
    end

    # パスワードが最小文字数より下回れば無効
    it 'a password maximum number' do
      min = 6
      author = build(:author, password: 'a' * (min - 1))
      author.valid?
      expect(author.errors[:password]).to include("は#{min}文字以上で入力してください")
    end

    # 説明が最大文字数を越えれば無効
    it 'a description maximum number' do
      max = 1000
      author = build(:author, description: 'あ' * (max + 1))
      author.valid?
      expect(author.errors[:description]).to include("は#{max}文字以内で入力してください")
    end
  end
end
