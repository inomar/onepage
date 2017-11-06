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

class Template < ApplicationRecord
  TEMPLATE_ATTRIBUTES = %i[subject description title summary story cover tag_list category_id].freeze

  has_many :pages
  belongs_to :author
  attachment :cover
  acts_as_taggable_on :tags
  belongs_to :category, optional: true

  enum status: { draft: 0, published: 1 }
  paginates_per 20

  validates :subject,       presence: true, length: { maximum: 100 }
  validates :description,   presence: true, length: { maximum: 500 }
  validates :author_id,     presence: true

  def inherit_template
    {
      title: title,
      summary: summary,
      cover_id: cover_id,
      category_id: category_id
    }
  end

  def self.is_open_templates
    where(status: :published)
  end
end
