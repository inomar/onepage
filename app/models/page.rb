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
  PAGE_ATTRIBUTES = %i[title summary story cover tag_list category_id template_id].freeze
  has_many :favorites
  has_many :authors, through: :favorites
  belongs_to :template, optional: true
  belongs_to :author
  attachment :cover
  acts_as_taggable_on :tags
  belongs_to :category

  enum status: { draft: 0, published: 1 }

  paginates_per 50

  validates :title, presence: true, length: { maximum: 100 }
  validates :summary, presence: true, length: { maximum: 100 }
  # TODO: 400文字制限なくそうかな？
  validates :story, presence: true, length: { maximum: 10_000 }
  validates :author_id, presence: true
  validates :category_id, presence: true

  # http://tackeyy.com/blog/posts/how-to-fix-acts-as-taggable-on-bug-on-rails-5_1_3
  scope :by_join_date, -> { order('created_at DESC') }
  scope :search_category, ->(category_name) { where(category_id: Category.by_name(category_name).id) }
  scope :search_tag, ->(tag_name) { tagged_with([tag_name]) }
  scope :tag_count, -> { tag_counts_on(:tags).order('count DESC') }

  def favorite_author(author_id)
    favorites.find_by(author_id: author_id)
  end

end
