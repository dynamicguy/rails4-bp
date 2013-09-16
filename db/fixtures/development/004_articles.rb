Article.delete_all

Article.seed(:id, [
    {id: 1, name: Faker::Company.name, content: Faker::HipsterIpsum.sentence, text: Faker::HipsterIpsum.paragraphs.join(" "), author_id: 1, guid: Time.now, type: 'post'},
    {id: 2, name: Faker::Company.name, content: Faker::HipsterIpsum.sentence, text: Faker::HipsterIpsum.paragraphs.join(" "), author_id: 1, guid: Time.now, type: 'post'},
    {id: 3, name: Faker::Company.name, content: Faker::HipsterIpsum.sentence, text: Faker::HipsterIpsum.paragraphs.join(" "), author_id: 1, guid: Time.now, type: 'post'},
    {id: 4, name: Faker::Company.name, content: Faker::HipsterIpsum.sentence, text: Faker::HipsterIpsum.paragraphs.join(" "), author_id: 1, guid: Time.now, type: 'post'},
    {id: 5, name: Faker::Company.name, content: Faker::HipsterIpsum.sentence, text: Faker::HipsterIpsum.paragraphs.join(" "), author_id: 1, guid: Time.now, type: 'post'},
    {id: 6, name: Faker::Company.name, content: Faker::HipsterIpsum.sentence, text: Faker::HipsterIpsum.paragraphs.join(" "), author_id: 1, guid: Time.now, type: 'post'},
    {id: 7, name: Faker::Company.name, content: Faker::HipsterIpsum.sentence, text: Faker::HipsterIpsum.paragraphs.join(" "), author_id: 1, guid: Time.now, type: 'post'},
    {id: 8, name: Faker::Company.name, content: Faker::HipsterIpsum.sentence, text: Faker::HipsterIpsum.paragraphs.join(" "), author_id: 1, guid: Time.now, type: 'post'},
    {id: 9, name: Faker::Company.name, content: Faker::HipsterIpsum.sentence, text: Faker::HipsterIpsum.paragraphs.join(" "), author_id: 1, guid: Time.now, type: 'post'},
    {id: 10, name: Faker::Company.name, content: Faker::HipsterIpsum.sentence, text: Faker::HipsterIpsum.paragraphs.join(" "), author_id: 1, guid: Time.now, type: 'post'},
])

