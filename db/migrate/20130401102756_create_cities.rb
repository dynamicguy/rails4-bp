class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities, :options => 'ENGINE=NDB'  do |t|
      t.primary_key :name
      t.string :countrycode
      t.string :district
      t.integer :population
    end
    add_index :cities, :countrycode
  end
end
