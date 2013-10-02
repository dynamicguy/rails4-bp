class AddFieldsToPages < ActiveRecord::Migration
  def change
    add_column :pages, :user_id, :integer
    add_column :pages, :person_id, :integer
    add_column :pages, :state, :string, default: :draft
  end
end
