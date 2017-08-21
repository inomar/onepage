class CreatePages < ActiveRecord::Migration[5.1]
  def change
    create_table :pages do |t|
      t.string :title, null: false
      t.string :summary, null: false
      t.text :story, null: false
      t.string :cover_id
      t.boolean :is_open, default: true

      t.timestamps
    end
  end
end
