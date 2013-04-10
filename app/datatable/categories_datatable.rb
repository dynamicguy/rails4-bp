class CategoriesDatatable
  delegate :params, :l, :link_to, :current_user, :truncate, :user_signed_in?, :edit_category_path, :strip_tags, :category_path, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    if params[:jqdata]
      {
          sEcho: params[:sEcho].to_i,
          iTotalRecords: Category.count,
          iTotalDisplayRecords: Category.count.to_i,
          aaData: data
      }
    else
      categories.as_json
    end

  end

  private

  def data
    categories.map do |category|
      [
          '<input id="bulk_ids_" name="bulk_ids[]" type="checkbox" value="'+category.id.to_s+'">'.html_safe,
          link_to(category.id, category),
          category.title,
          strip_tags(category.content),
          category.depth,
          category.secret_field,
          (link_to('Edit', edit_category_path(category), :class => 'btn btn-mini') + " " +
              link_to('Delete', category_path(category), :method => :delete, :data => {:confirm => 'Are you sure?'}, :class => 'btn btn-mini btn-danger'))
      ]
    end
  end

  def categories
    @categories ||= fetch_categories
  end

  def fetch_categories
    categories = Category.order("#{sort_column} #{sort_direction}")
    categories = categories.page(page).per(per_page)

    #if user_signed_in?
     # unless current_user.has_role?(:admin)
      #  categories = categories.find(Country.active.includes(:categories).collect { |c| c.categories.collect { |t| t } }.flatten.collect { |c| c.id }.to_a)
      #end
   # end

    if params[:sSearch].present?
      categories = categories.where("title like :search or content like :search", search: "%#{params[:sSearch]}%")
    end

    categories
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[id title content]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end