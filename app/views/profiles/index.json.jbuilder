json.array!(@profiles) do |profile|
  json.extract! profile, :first_name, :last_name, :image_url, :image_url_small, :image_url_medium, :birthday, :gender, :bio, :searchable, :user_id, :location, :full_name, :nsfw
  json.url profile_url(profile, format: :json)
end
