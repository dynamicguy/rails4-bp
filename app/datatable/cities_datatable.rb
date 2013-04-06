class CitiesDatatable
  delegate :params, :l, :link_to, :current_user, :truncate, :user_signed_in?, :edit_city_path, :city_path, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    if params[:jqdata]
      {
          sEcho: params[:sEcho].to_i,
          iTotalRecords: City.count,
          iTotalDisplayRecords: cities.total_entries,
          aaData: data
      }
    else
      cities.as_json
    end

  end

  private

  def data
    cities.map do |city|
      [
          '<input id="bulk_ids_" name="bulk_ids[]" type="checkbox" value="'+city.id.to_s+'">'.html_safe,
          link_to(city.name, city),
          city.iso_code,
          (city.country.name if city.country.present?),
          l(city.created_at, :format => :short),
          (link_to('Edit', edit_city_path(city), :class => 'btn btn-mini') + " " +
              link_to('Delete', city_path(city), :method => :delete, :data => {:confirm => 'Are you sure?'}, :class => 'btn btn-mini btn-danger'))
      ]
    end
  end

  def cities
    @cities ||= fetch_cities
  end

  def fetch_cities
    cities = City.order("#{sort_column} #{sort_direction}")
    cities = cities.page(page).per_page(per_page)

    if user_signed_in?
      unless current_user.has_role?(:admin)
        cities = cities.find(Country.active.includes(:cities).collect { |c| c.cities.collect { |t| t } }.flatten.collect { |c| c.id }.to_a)
      end
    end

    if params[:sSearch].present?
      cities = cities.where("name like :search or iso_code like :search", search: "%#{params[:sSearch]}%")
    end

    cities
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[id name iso_code country_id created_at]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end