@Rails4Bp.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
  class Entities.Country extends Entities.Model
    idAttribute: 'code'
    initialize: ->
      @url = (if @id then "/countries/" + @id else "/countries")

  class Entities.CountriesCollection extends App.Entities.PageableCollection
    model: Entities.Country
    url: ->
      Routes.countries_path()
    queryParams:
      sortKey: "order"
      order: "dir"
      directions:
        "-1": "asc"
        1: "desc"
    state:
      pageSize: 20
      sortKey: "id"
      order: 1

  API =
    getCountries: ->
      countries = new Entities.CountriesCollection
      countries.fetch
        reset: true
      countries

    getCountry: (id) ->
      country = new Entities.Country
        code: id
      country.fetch()
      country

    newCountry: ->
      new Entities.Country

  App.reqres.setHandler "country:entities", ->
    API.getCountries()

  App.reqres.setHandler "country:entity", (id) ->
    API.getCountry id

  App.reqres.setHandler "new:country:entity", ->
    API.newCountry()
