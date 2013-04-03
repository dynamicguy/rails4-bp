class CreateCountries < ActiveRecord::Migration

  def change
    create_table "countries", id: false, force: true, :options => 'ENGINE=NDB' do |t|
      t.string "code"
      t.string "name", null: false
      t.string "continent", default: "Asia", null: false
      t.string "region", default: "", null: false
      t.decimal "surfacearea", precision: 10, scale: 0, default: 0, null: false
      t.integer "indepyear", default: 0
      t.integer "population", default: 0, null: false
      t.decimal "lifeexpectancy", precision: 10, scale: 0
      t.decimal "gnp", precision: 10, scale: 0
      t.decimal "gnpold", precision: 10, scale: 0
      t.string "localname", default: "", null: false
      t.string "governmentform", default: "", null: false
      t.string "headofstate", default: ""
      t.integer "capital", default: 0
      t.string "code2", default: "", null: false
    end
  end
end
