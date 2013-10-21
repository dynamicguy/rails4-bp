User.seed(:id, [
    {id: 2, confirmed_at: Time.now, password: 'please', email: 'user@local.host', name: 'Demo User'},
    {id: 3, confirmed_at: Time.now, password: 'please', email: 'manager@local.host', name: 'Manager User'},
    {id: 4, confirmed_at: Time.now, password: 'please', email: 'agent@local.host', name: 'Agent User'},
    {id: 5, confirmed_at: Time.now, password: 'please', email: 'customer@local.host', name: 'Customer User'},
    {id: 6, confirmed_at: Time.now, password: 'please', email: 'driver@local.host', name: 'Driver User'},
    {id: 7, confirmed_at: Time.now, password: 'please', email: 'sales@local.host', name: 'Sales User'},
    {id: 8, confirmed_at: Time.now, password: 'please', email: Faker::Internet.email, name: Faker::Name.name},
    {id: 9, confirmed_at: Time.now, password: 'please', email: Faker::Internet.email, name: Faker::Name.name},
    {id: 10, confirmed_at: Time.now, password: 'please', email: Faker::Internet.email, name: Faker::Name.name},
    {id: 11, confirmed_at: Time.now, password: 'please', email: Faker::Internet.email, name: Faker::Name.name},
    {id: 12, confirmed_at: Time.now, password: 'please', email: Faker::Internet.email, name: Faker::Name.name},
    {id: 13, confirmed_at: Time.now, password: 'please', email: Faker::Internet.email, name: Faker::Name.name},
    {id: 14, confirmed_at: Time.now, password: 'please', email: Faker::Internet.email, name: Faker::Name.name},
    {id: 15, confirmed_at: Time.now, password: 'please', email: Faker::Internet.email, name: Faker::Name.name},
    {id: 16, confirmed_at: Time.now, password: 'please', email: Faker::Internet.email, name: Faker::Name.name},
    {id: 17, confirmed_at: Time.now, password: 'please', email: Faker::Internet.email, name: Faker::Name.name},
    {id: 18, confirmed_at: Time.now, password: 'please', email: Faker::Internet.email, name: Faker::Name.name},
    {id: 19, confirmed_at: Time.now, password: 'please', email: Faker::Internet.email, name: Faker::Name.name}
])

