class CreateCountries < ActiveRecord::Migration

  def change
    create_table :countries , :options => 'ENGINE=NDB' do |t|
      t.primary_key :code, :null => false, :size => 3
      t.string :name, :null => false, :size => 52
      t.string :continent, :null => false, :default => "Asia"
      t.string :region, :null => false, :default => "", :size => 26
      t.decimal :surfacearea, :null => false, :default => 0.00
      t.integer :indepyear, :null => true, :default => 0, :size => 6
      t.integer :population, :null => false, :default => 0, :size => 11
      t.decimal :lifeexpectancy, :null => true, :default => nil
      t.decimal :gnp, :null => true, :default => nil
      t.decimal :gnpold, :null => true, :default => nil
      t.string :localname, :null => false, :default => "", :size => 45
      t.string :governmentform, :null => false, :default => "", :size => 45
      t.string :headofstate, :null => true, :default => "", :size => 60
      t.integer :capital, :null => true, :default => "", :size => 11
      t.string :code2, :null => false, :default => "", :size => 2
    end
  end
end
