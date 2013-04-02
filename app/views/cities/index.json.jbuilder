json.array!(@cities) do |city|
  json.extract! city, :name, :countrycode, :district, :population
  json.url city_url(city, format: :json)
end