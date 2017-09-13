class Category < ApplicationRecord
	has_many :pages
	has_many :templates
end
