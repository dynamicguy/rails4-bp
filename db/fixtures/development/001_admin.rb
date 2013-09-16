User.delete_all

User.seed(:id, [{id: 1, password: 'please', confirmed_at: Time.now, email: 'admin@local.host'}])

admin = User.find 1
#admin.add_role :admin
admin.save!

if admin.valid?
  puts %q[
Administrator account created:

login.........admin@local.host
password......please
]
end
