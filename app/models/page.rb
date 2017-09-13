# == Schema Information
#
# Table name: pages
#
#  id         :integer          not null, primary key
#  title      :string(255)      not null
#  summary    :string(255)      not null
#  story      :text(65535)      not null
#  cover_id   :string(255)
#  is_open    :boolean          default(TRUE)
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Page < ApplicationRecord
  PAGE_ATTRIBUTES = %i(title summary story cover tag_list category_id template_id).freeze
  belongs_to :template, optional: true
  belongs_to :author
  attachment :cover
  acts_as_taggable_on :tags
  belongs_to :category
end
