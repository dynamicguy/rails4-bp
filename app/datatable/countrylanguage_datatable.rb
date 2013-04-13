class CountrylanguageDatatable
  delegate :params, :l, :link_to, :current_user, :truncate, :user_signed_in?, :edit_countrylanguage_path, :strip_tags, :countrylanguage_path, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    if params[:jqdata]
      {
          sEcho: params[:sEcho].to_i,
          iTotalRecords: Countrylanguage.count,
          iTotalDisplayRecords: countrylanguages.count,
          aaData: data
      }
    else
      countrylanguages.as_json
    end

  end

  private

  def data
    countrylanguages.page(page).per(per_page).map do |countrylanguage|
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
    #if user_signed_in?
    # unless current_user.has_role?(:admin)
    #  countrylanguages = countrylanguages.find(Country.active.includes(:countrylanguages).collect { |c| c.countrylanguages.collect { |t| t } }.flatten.collect { |c| c.id }.to_a)
    #end
    # end

    if params[:sSearch].present?
      countrylanguages = countrylanguages.where("countrycode like :search or language like :search", search: "%#{params[:sSearch]}%")
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
    columns = %w[countrycode language isofficial percentage]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end