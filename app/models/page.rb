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

class Page < ApplicationRecord
  PAGE_ATTRIBUTES = %i[title summary story cover book_cover tag_list template_id image_id category_id].freeze
  has_many :favorites
  has_many :authors, through: :favorites
  belongs_to :template, optional: true
  belongs_to :author
  acts_as_taggable_on :tags
  belongs_to :category, optional: true
  has_drafts

  enum status: { draft: 0, published: 1 }

  paginates_per 50

  # with_option
  validates :title, length: { maximum: 100 }
  validates :summary, length: { maximum: 200 }
  validates :story, length: { maximum: 10_000 }
  validates :author_id, presence: true

  with_options unless: :is_draft? do |page|
    page.validates :title, presence: true
    page.validates :summary, presence: true
    page.validates :story, presence: true
  end


  # http://tackeyy.com/blog/posts/how-to-fix-acts-as-taggable-on-bug-on-rails-5_1_3
  scope :by_join_date, -> { order('created_at DESC') }
  scope :published, -> { where(status: 1)}
  scope :search_category, ->(category_name) { where(category_id: Category.by_name(category_name).id) }
  scope :search_tag, ->(tag_name) { tagged_with([tag_name]) }
  scope :tag_count, -> { tag_counts_on(:tags).order('count DESC') }

  def is_draft?
    status == 'draft'
  end

  def favorite_author(author_id)
    favorites.find_by(author_id: author_id)
  end

  def has_current_author?(current_author)
    current_author == author
  end


end
