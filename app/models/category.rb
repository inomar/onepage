# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ApplicationRecord
	has_many :pages
	has_many :templates

	scope :with_pages, -> { joins(:pages) }

	def self.by_name(name)
		find_by(name: name)
	end
end
