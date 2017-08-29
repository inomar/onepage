class Page < ApplicationRecord
  belongs_to :author
  attachment :cover
end
