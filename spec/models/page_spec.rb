# == Schema Information
#
# Table name: pages
#
#  id          :integer          not null, primary key
#  title       :string(255)      not null
#  summary     :string(255)
#  story       :text(65535)      not null
#  cover_id    :string(255)
#  cover_url   :string(255)
#  status      :integer          default("published")
#  author_id   :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#  template_id :integer
#

require 'rails_helper'

RSpec.describe Page, type: :model do
  it 'has a valid factory' do
    expect(build(:page)).to be_valid
  end

  context 'is valid' do
    it 'with a title, summary, story and author' do
      author = create(:author)
      page = build(:page,
                   title: 'タイトル',
                   summary: 'サマリー',
                   story: 'ストーリー',
                   author: author)
      expect(page).to be_valid
    end
  end

  context 'is invalid' do
    it 'without a title' do
      page = build(:page, title: nil)
      page.valid?
      expect(page.errors[:title]).to include('を入力してください')
    end

    it 'without a summary' do
      page = build(:page, summary: nil)
      page.valid?
      expect(page.errors[:summary]).to include('を入力してください')
    end

    it 'without a story' do
      page = build(:page, story: nil)
      page.valid?
      expect(page.errors[:story]).to include('を入力してください')
    end

    it 'without a author' do
      page = build(:page, author_id: nil)
      page.valid?
      expect(page.errors[:author_id]).to include('を入力してください')
    end

    it 'without a category' do
      page = build(:page, category_id: nil)
      page.valid?
      expect(page.errors[:category_id]).to include('を入力してください')
    end

    it 'title string maximum number' do
      max = 100
      page = build(:page, title: 'あ' * (max + 1))
      page.valid?
      expect(page.errors[:title]).to include("は#{max}文字以内で入力してください")
    end

    it 'summary string maximum number' do
      max = 100
      page = build(:page, summary: 'あ' * (max + 1))
      page.valid?
      expect(page.errors[:summary]).to include("は#{max}文字以内で入力してください")
    end

    it 'story string maximum number' do
      max = 10_000
      page = build(:page, story: 'あ' * (max + 1))
      page.valid?
      expect(page.errors[:story]).to include("は#{max}文字以内で入力してください")
    end
  end
end
