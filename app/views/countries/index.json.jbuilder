json.array!(@countries) do |country|
  json.extract! country, :code, :name, :continent, :region, :surfacearea, :indepyear, :population, :lifeexpectancy, :gnp, :gnpold, :localname, :governmentform, :headofstate, :capital, :code2
  json.url country_url(country, format: :json)
end