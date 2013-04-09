json.array!(@categories) do |category|
  json.extract! category, :title, :content, :secret_field, :parent_id, :lft, :rgt, :depth
  json.url category_url(category, format: :json)
end