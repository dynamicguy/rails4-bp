class CountriesDatatable
  delegate :params, :l, :link_to, :current_user, :truncate, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    raise countries.inspect
    if params[:jqdata]
      {
          sEcho: params[:sEcho].to_i,
          iTotalRecords: Country.count,

          iTotalDisplayRecords: countries.total_entries,
          aaData: data
      }
    else
      countries.as_json
    end
  end

  private

  def data
    countries.map do |country|
      [
          link_to(country.code, country),
          country.name,
          country.continent,
          country.region,
          country.surfacearea,
          country.indepyear,
          country.population,
          country.lifeexpectancy,
          country.gnp,
          country.gnpold,
          country.localname,
          country.governmentform,
          country.headofstate,
          country.capital,
          country.code2,

          (link_to('Edit', "/countries/#{country.code}/edit", :class => 'btn btn-mini') + " " +
              link_to('Delete', "/countries/#{country.code}", :method => :delete, :data => {:confirm => 'Are you sure?'}, :class => 'btn btn-mini btn-danger'))
      ]
    end
  end

  def countries
    @countries ||= fetch_countries
  end

  def fetch_countries
    countries = Country.order("#{sort_column} #{sort_direction}")
    countries = countries.page(page).per(per_page)
    if params[:sSearch].present?
      countries = countries.where("name like :search or code like :search", search: "%#{params[:sSearch]}%")
    end
    countries
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end
  private

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[code name continent region surfacearea indepyear population lifeexpectancy gnp gnpold governmentform headofstate capital code2]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end