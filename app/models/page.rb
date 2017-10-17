# == Schema Information
#
# Table name: pages
#
#  id          :integer          not null, primary key
#  title       :string(255)      not null
#  summary     :string(255)      not null
#  story       :text(65535)      not null
#  cover_id    :string(255)
#  is_open     :boolean          default(TRUE)
#  author_id   :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#  template_id :integer
#

class Page < ApplicationRecord
  PAGE_ATTRIBUTES = %i(title summary story cover tag_list category_id template_id).freeze
  has_many :favorites
  has_many :authors, through: :favorites
  belongs_to :template, optional: true
  belongs_to :author
  attachment :cover
  acts_as_taggable_on :tags
  belongs_to :category

  validates :title, presence: true, length: { maximum: 100 }
  validates :summary, presence: true, length: { maximum: 100 }
  # TODO: 400文字制限なくそうかな？
  validates :story, presence: true, length: { maximum: 10000 }
  validates :author_id, presence: true
  validates :category_id, presence: true

	scope :search_category, -> (category_id){ where(category: category_id) }
  scope :search_tag, -> { tag_counts_on(:tags).order('count DESC') }

  def favorite_author(author_id)
    favorites.find_by(author_id: author_id)
	end

end
