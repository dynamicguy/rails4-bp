class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :status, limit: 1, default: 0
      t.integer :hidden, limit: 1, default: 0
      t.string :created_uid
      t.string :modified_uid
      t.integer :global_admin, limit: 1, default: 0
      t.string :website
      t.string :phone
      t.integer :ssl, limit: 1, default: 0

      t.timestamps
    end
  end
end
