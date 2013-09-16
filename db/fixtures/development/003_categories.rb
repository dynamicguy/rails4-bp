Category.delete_all

Category.seed(:id, [
    {id: 1, title: Faker::Company.name, content: Faker::HipsterIpsum.paragraphs.join(" ")},
    {id: 2, title: Faker::Company.name, content: Faker::HipsterIpsum.paragraphs.join(" ")},
    {id: 3, title: Faker::Company.name, content: Faker::HipsterIpsum.paragraphs.join(" ")},
    {id: 4, title: Faker::Company.name, content: Faker::HipsterIpsum.paragraphs.join(" ")},
    {id: 5, title: Faker::Company.name, content: Faker::HipsterIpsum.paragraphs.join(" ")},
    {id: 6, title: Faker::Company.name, content: Faker::HipsterIpsum.paragraphs.join(" ")},
    {id: 7, title: Faker::Company.name, content: Faker::HipsterIpsum.paragraphs.join(" ")},
    {id: 8, title: Faker::Company.name, content: Faker::HipsterIpsum.paragraphs.join(" ")},
    {id: 9, title: Faker::Company.name, content: Faker::HipsterIpsum.paragraphs.join(" ")},
    {id: 10, title: Faker::Company.name, content: Faker::HipsterIpsum.paragraphs.join(" ")},
])

