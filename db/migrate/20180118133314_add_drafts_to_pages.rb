class AddDraftsToPages < ActiveRecord::Migration[5.1]
  def change
    add_column :pages, :draft_id, :integer
    add_column :pages, :published_at, :timestamp
    add_column :pages, :trashed_at, :timestamp
  end
end
