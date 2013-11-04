class CreateCountries < ActiveRecord::Migration

  def change
    create_table "countries", id: false, force: true do |t|
      t.string "code", primary_key: true
      t.string "name", null: false
      t.string "continent", default: "Asia", null: false
      t.string "region", default: "", null: false
      t.integer "surfacearea"
      t.integer "indepyear", default: 0
      t.integer "population", default: 0, null: false
      t.integer "lifeexpectancy"
      t.integer "gnp"
      t.integer "gnpold"
      t.string "localname", default: "", null: false
      t.string "governmentform", default: "", null: false
      t.string "headofstate", default: ""
      t.integer "capital", default: 0
      t.string "code2", default: "", null: false
    end
  end
end
