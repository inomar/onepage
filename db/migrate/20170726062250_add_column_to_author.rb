class AddColumnToAuthor < ActiveRecord::Migration[5.1]
  def change
    add_column :authors, :name, :string
    add_column :authors, :pen_name, :string
    add_column :authors, :image_id, :string
    add_column :authors, :description, :text
    add_column :authors, :other, :text
    add_column :authors, :social_profile_id, :integer
  end
end
