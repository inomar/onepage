# == Schema Information
#
# Table name: templates
#
#  id          :integer          not null, primary key
#  subject     :string(255)      not null
#  title       :string(255)
#  summary     :string(255)
#  description :text(65535)      not null
#  cover_id    :string(255)
#  category_id :integer
#  is_open     :boolean
#  author_id   :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Template, type: :model do

	it 'has a valid factory' do
		expect(build :template).to be_valid
	end

	# 有効である状態
	context 'is valid' do
		# 題材と説明、作者があれば有効
		it 'with a subject, description, author' do
			author = create(:author)
			template = Template.new(subject: 'a',
															description: 'aa',
															author_id: author.id)
			expect(template).to be_valid
		end
	end

	# 無効である状態
	context 'is invalid' do
		it 'without a subject' do
			template = build :template, subject: nil
			template.valid?
			expect(template.errors[:subject]).to include('を入力してください')
		end

		it 'without a description' do
      template = build :template, description: nil
      template.valid?
      expect(template.errors[:description]).to include('を入力してください')
		end

		it 'without an author' do
			template = build :template, author_id: nil
			template.valid?
			expect(template.errors[:author_id]).to include('を入力してください')
		end

		it 'a description maximum number of characters' do
			max = 500
      template = build :template, description: 'あ' * (max + 1)
      template.valid?
			expect(template.errors[:description]).to include("は#{max}文字以内で入力してください")
		end

		it 'a subject maximum number of characters' do
			max = 100
			template = build :template, subject: 'あ' * (max + 1)
			template.valid?
			expect(template.errors[:subject]).to include("は#{max}文字以内で入力してください")
		end

	end
end
