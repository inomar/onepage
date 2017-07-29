class CreatePages < ActiveRecord::Migration[5.1]
  def change
    create_table :pages do |t|
      t.string :title, null: false
      t.string :summary, null: false
      t.text :story, null: false
      t.text :cover
      t.boolean :is_open, default: false

      t.timestamps
    end
  end
end
