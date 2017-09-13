class Template < ApplicationRecord
	TEMPLATE_ATTRIBUTES = %i(subject description title summary story cover tag_list category_id).freeze
	belongs_to :author
	attachment :cover
	acts_as_taggable_on :tags
	belongs_to :category
end
