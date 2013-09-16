class AddFieldsToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :author_id, :integer, :null => false
    add_column :articles, :public, :boolean, :default => false, :null => false
    add_column :articles, :guid, :boolean, :null => false
    add_column :articles, :pending, :boolean, :default => false, :null => false
    add_column :articles, :type, :string, :limit => 40, :null => false
    add_column :articles, :text, :text
    add_column :articles, :likes_count, :integer, :default => 0
    add_column :articles, :favorite, :boolean, :default => false
  end
end
