class CountrylanguageDatatable
  delegate :params, :l, :link_to, :current_user, :truncate, :user_signed_in?, :edit_countrylanguage_path, :countrylanguage_path, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    if params[:jqdata]
      {
          sEcho: params[:sEcho].to_i,
          iTotalRecords: Countrylanguage.count,
          iTotalDisplayRecords: Countrylanguage.count.to_i,
          aaData: data
      }
    else
      countrylanguages.as_json
    end

  end

  private

  def data
    countrylanguages.map do |countrylanguage|
      [
          countrylanguage.countrycode,
          countrylanguage.language,
          countrylanguage.isofficial,
          countrylanguage.percentage,
          (link_to('Edit', edit_countrylanguage_path(countrylanguage), :class => 'btn btn-mini') + " " +
              link_to('Delete', countrylanguage_path(countrylanguage), :method => :delete, :data => {:confirm => 'Are you sure?'}, :class => 'btn btn-mini btn-danger'))
      ]
    end
  end

  def countrylanguages
    @countrylanguages ||= fetch_countrylanguages
  end

  def fetch_countrylanguages
    countrylanguages = Countrylanguage.order("#{sort_column} #{sort_direction}")
    countrylanguages = countrylanguages.page(page).per(per_page)

    #if user_signed_in?
    # unless current_user.has_role?(:admin)
    #  cities = cities.find(Country.active.includes(:cities).collect { |c| c.cities.collect { |t| t } }.flatten.collect { |c| c.id }.to_a)
    #end
    # end

    if params[:sSearch].present?
      countrylanguages = countrylanguages.where("language like :search or countrycode like :search", search: "%#{params[:sSearch]}%")
    end

    countrylanguages
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[ countrycode language isofficial percentage]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end