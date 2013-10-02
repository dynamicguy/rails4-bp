class AddLanguageToUser < ActiveRecord::Migration
  def change
    add_column :users, :language, :string, :limit => 2, :default => 'en'
  end
end
