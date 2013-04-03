class CreateCountrylanguages < ActiveRecord::Migration
  def change
    create_table "countrylanguages", id: false, force: true, :options => 'ENGINE=NDB'  do |t|
      t.string  "countrycode"
      t.string  "language"
      t.boolean "isofficial",                           default: false
      t.decimal "percentage",  precision: 10, scale: 0, default: 0
    end
  end
end
