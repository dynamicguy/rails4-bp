class CreateCountrylanguages < ActiveRecord::Migration
  def change
    create_table :countrylanguages, :options => 'ENGINE=NDB'  do |t|
      t.primary_key :countrycode
      t.string :language
      t.boolean :isofficial, :default => false
      t.decimal :percentage, :default => 0.00
    end
  end
end
