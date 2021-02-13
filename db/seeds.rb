puts('Seeding started...')
if Rails.env.development?
  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
  User.create!(email: 'user@test.com', password: 'password', password_confirmation: 'password', superadmin_role: true)
end
