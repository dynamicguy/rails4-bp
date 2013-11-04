class CreateCountrylanguages < ActiveRecord::Migration
  def change
    create_table "countrylanguages", id: false, force: true do |t|
      t.string "countrycode"
      t.string "language"
      t.string "isofficial", default: false
      t.integer "percentage"
    end
    execute "ALTER TABLE countrylanguages ADD PRIMARY KEY (language, countrycode);"
    add_index :countrylanguages, ["language", "countrycode"]
    add_index :countrylanguages, :countrycode
  end
end
