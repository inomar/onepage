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

  def favorite_author(author_id)
    favorites.find_by(author_id: author_id)
  end
end
