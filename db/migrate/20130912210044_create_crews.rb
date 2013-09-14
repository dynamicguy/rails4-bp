class CreateCrews < ActiveRecord::Migration
  def change
    create_table :crews do |t|
      t.integer :age
      t.string :name
      t.string :avatar
      t.string :title
      t.string :species
      t.string :origin
      t.string :quote

      t.timestamps
    end
  end
end
