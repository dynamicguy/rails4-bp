class CreateFolders < ActiveRecord::Migration
  def change
    create_table :folders do |t|
      t.string :name
      t.integer :parent_id
      t.integer :project_id
      t.integer :import_id
      t.boolean :deleted, default: false
      t.boolean :hidden, default: false
      t.boolean :toc_open, default: false
      t.string :link_url

      t.timestamps
    end
  end
end
