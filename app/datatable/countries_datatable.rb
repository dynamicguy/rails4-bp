class CountriesDatatable
  delegate :params, :l, :link_to, :current_user, :truncate, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
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
          '<input id="bulk_ids_" name="bulk_ids[]" type="checkbox" value="'+country.id.to_s+'">'.html_safe,
          link_to(country.name, country),
          country.iso_code,
          country.status,
          l(country.created_at, :format => :short),
          (link_to('Edit', "/countries/#{country.id}/edit", :class => 'btn btn-mini') + " " +
              link_to('Delete', "/countries/#{country.id}", :method => :delete, :data => {:confirm => 'Are you sure?'}, :class => 'btn btn-mini btn-danger'))
      ]
    end
  end

  def countries
    @countries ||= fetch_countries
  end

  def fetch_countries
    countries = Country.order("#{sort_column} #{sort_direction}")
    countries = countries.page(page).per_page(per_page)
    if params[:sSearch].present?
      countries = countries.where("name like :search or iso_code like :search", search: "%#{params[:sSearch]}%")
    end
    countries
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[id name iso_code status created_at]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end