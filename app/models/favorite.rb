class Favorite < ApplicationRecord
	belongs_to :author
	belongs_to :page
end
