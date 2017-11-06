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
#  status      :integer          default("published")
#  author_id   :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Template, type: :model do
  it 'has a valid factory' do
    expect(build(:template)).to be_valid
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

  describe 'inherit template' do
    before do
      @other_template = { title: 'タイトル', summary: 'サマリー', cover_id: 'cover_id', category_id: 1 }
    end
    context 'with matching object' do
      it 'returns a page object' do
        template = build(:template,
                         title: 'タイトル',
                         summary: 'サマリー',
                         cover_id: 'cover_id',
                         category_id: 1)
        expect(template.inherit_template).to eq @other_template
      end
    end

    context 'with no matching object' do
      it 'omits results that do not match' do
        template = build(:template, title: 'タイトル2')
        expect(template.inherit_template).to_not eq @other_template
      end
    end
  end

  describe 'is open' do
    before do
      @h_template = create(:template, title: 'ホラー', is_open: true)
      @l_template = create(:template, title: 'ラブロマンス', is_open: false)
      @m_template = create(:template, title: 'ミステリー', is_open: false)
    end

    context 'with matching templates' do
      it 'returns open templates' do
        expect(Template.is_open_templates).to eq [@h_template]
      end
    end

    context 'with no matching templates' do
      it 'omits results that do not match' do
        expect(Template.is_open_templates).to_not eq [@l_template, @m_template]
      end
    end
  end
end
