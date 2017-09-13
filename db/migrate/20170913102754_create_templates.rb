class CreateTemplates < ActiveRecord::Migration[5.1]
  def change
    create_table :templates do |t|
      t.string :title
      t.string :summary
      t.text :description, null: false
      t.string :cover_id
      t.integer :category_id
      t.boolean :is_open, defautl: true
      t.integer :author_id, null: false

      t.timestamps
    end
  end
end
