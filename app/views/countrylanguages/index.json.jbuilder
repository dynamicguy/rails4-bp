json.array!(@countrylanguages) do |countrylanguage|
  json.extract! countrylanguage, :countrycode, :language, :isofficial, :percentage
  json.url countrylanguage_url(countrylanguage, format: :json)
end