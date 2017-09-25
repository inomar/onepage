class CreateFavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :favorites do |t|
      t.references :author, null:false
      t.references :page, null:false
      t.timestamps null: false
    end
  end
end
