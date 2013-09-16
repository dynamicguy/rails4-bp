attributes :id, :first_name, :last_name, :full_name, :created_at, :updated_at

node do |user|
	{
		:created_at_formatted => user.created_at.strftime("%m/%d/%Y"),
		:updated_at_formatted => time_ago_in_words(user.updated_at),
		:is_admin 						=> true
	}
end