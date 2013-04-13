class PagesDatatable
  delegate :params, :l, :link_to, :current_user, :truncate, :user_signed_in?, :edit_page_path, :strip_tags, :page_path, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    if params[:jqdata]
      {
          sEcho: params[:sEcho].to_i,
          iTotalRecords: Page.count,
          iTotalDisplayRecords: pages.count,
          aaData: data
      }
    else
      pages.as_json
    end

  end

  private

  def data
    #pages = pages.page(page)
    pages.page(page).per(per_page).map do |page|
      [
          '<input id="bulk_ids_" name="bulk_ids[]" type="checkbox" value="'+page.id.to_s+'">'.html_safe,
          link_to(page.id, page),
          page.title,
          truncate(strip_tags(page.content.to_s)),
          page.parent_id,
          page.depth,
          (link_to('Edit', edit_page_path(page), :class => 'btn btn-mini') + " " +
              link_to('Delete', page_path(page), :method => :delete, :data => {:confirm => 'Are you sure?'}, :class => 'btn btn-mini btn-danger'))
      ]
    end
  end

  def pages
    @pages ||= fetch_pages
  end

  def fetch_pages
    pages = Page.order("#{sort_column} #{sort_direction}")
    #if user_signed_in?
    # unless current_user.has_role?(:admin)
    #  pages = pages.find(Country.active.includes(:pages).collect { |c| c.pages.collect { |t| t } }.flatten.collect { |c| c.id }.to_a)
    #end
    # end

    if params[:sSearch].present?
      pages = pages.where("title like :search or content like :search", search: "%#{params[:sSearch]}%")
    end

    pages
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[id title content parent_id depth]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end