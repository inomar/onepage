class CreateSocialProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :social_profiles do |t|
      t.references :author, foreign_key: true
      t.string :access_token
      t.string :provider
      t.string :access_secret
      t.string :uid
      t.string :name
      t.string :pen_name
      t.string :email
      t.string :url
      t.string :image_url
      t.string :description
      t.text :other
      t.text :credentials
      t.text :raw_info

      t.timestamps
    end
    add_index :social_profiles, %i[provider uid], unique: true
  end
end
