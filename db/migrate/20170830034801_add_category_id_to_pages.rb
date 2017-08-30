class AddCategoryIdToPages < ActiveRecord::Migration[5.1]
  def change
    add_column :pages, :category_id, :integer
  end
end
