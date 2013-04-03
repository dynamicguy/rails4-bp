class CreateCities < ActiveRecord::Migration
  def change
    create_table "cities", force: true, :options => 'ENGINE=NDB'  do |t|
      t.string  "name",        limit: 35, default: "", null: false
      t.string  "countrycode", limit: 3,  default: "", null: false
      t.string  "district",    limit: 20, default: "", null: false
      t.integer "population",             default: 0,  null: false
    end

    add_index "cities", ["countrycode"], name: "countrycode"
  end
end
