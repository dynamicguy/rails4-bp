User.delete_all

admin = User.create!(id: 1, name: 'Admin User', password: 'please', confirmed_at: Time.now, email: 'admin@local.host') unless User.find_by(email: 'admin@local.host')

if admin
  puts %q[
Administrator account created:

login.........admin@local.host
password......please
]
end
