class Page < ApplicationRecord
  belongs_to :author
  attachment :cover
  acts_as_taggable_on :tags
end
