class CreateSiteSettings < ActiveRecord::Migration
  def change
    create_table :site_settings do |t|
      t.string :name
      t.integer :data_type
      t.text :value

      t.timestamps
    end
  end
end
