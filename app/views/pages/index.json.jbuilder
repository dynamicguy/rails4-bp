json.array!(@pages) do |page|
  json.extract! page, :title, :content, :secret_field, :parent_id, :lft, :rgt, :depth
  json.url page_url(page, format: :json)
end