class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name, :limit => 127
      t.string :last_name, :limit => 127
      t.string :image_url
      t.string :image_url_small
      t.string :image_url_medium
      t.date :birthday
      t.string :gender
      t.text :bio
      t.boolean :searchable, :default => true, :null => false
      t.integer :user_id, :null => false
      t.string :location
      t.string :full_name, :limit => 70
      t.boolean :nsfw, :default => false

      t.timestamps
    end
    add_index :profiles, :full_name
    add_index :profiles, :user_id

  end
end
