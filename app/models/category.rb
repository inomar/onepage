class Category < ApplicationRecord
	has_many :category_pages
	has_many :pages, through: :category_pages
end
