##############################
# Pages
##############################

User.all.each do |user|
  10.times do
    user.pages.create!(
        secret_field: Faker::Lorem.sentence,
        title:   Faker::Lorem.sentence,
        content: Faker::Lorem.paragraphs(3).join,
        user_id: User.first.id,
        secret_field: Faker::Company.name,
        state: %w[draft published].sample
    )
  end
end

p "Pages created"