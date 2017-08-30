class CreateCategoryPages < ActiveRecord::Migration[5.1]
  def change
    create_table :category_pages do |t|
      t.integer :category_id
      t.integer :page_id

      t.timestamps
    end
  end
end
