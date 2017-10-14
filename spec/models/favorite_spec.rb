# == Schema Information
#
# Table name: favorites
#
#  id         :integer          not null, primary key
#  author_id  :integer          not null
#  page_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Favorite, type: :model do
  # 有効なファクトリを持つこと
  it 'has a valid factory' do
	  expect(build(:favorite)).to be_valid
	end

	# 有効である状態
	context 'is valid' do
		it 'with a page_id, a author_id' do
			favorite = build(:favorite,
			  page_id: 1,
			  author_id: 1)
			expect(favorite).to be_valid
		end
	end

	# 無効である状態
	context 'is invalid' do
		it 'without a page_id' do
			favorite = build(:favorite, page_id: nil)
			favorite.valid?
			expect(favorite.errors[:page]).to include('を入力してください')
		end

    it 'without a author_id' do
      favorite = build(:favorite, author_id: nil)
      favorite.valid?
      expect(favorite.errors[:author]).to include('を入力してください')
    end
	end
end
