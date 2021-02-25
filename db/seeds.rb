puts('Seeding started...')
if Rails.env.development?
  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

  Country.create!(name: 'Macedonia', code: 'MK')

  School.create!(name: 'OU Josip Broz Tito', address: 'Struga', country_id: 1)

  User.create!(
      first_name: 'User',
      last_name: 'Test',
      email: 'user@test.com',
      password: 'password',
      password_confirmation: 'password',
      school_id: 1,
      superadmin_role: true
  )

  User.create!(
      first_name: 'Teacher',
      last_name: 'Test',
      email: 'teacher@test.com',
      password: 'password',
      password_confirmation: 'password',
      school_id: 1,
      teacher_role: true
  )

  Room.create!(name: 'C1', head_teacher_id: User.find(2).id, school_id: 1,)

  User.create!(
      first_name: 'Student',
      last_name: 'Test',
      email: 'student@test.com',
      password: 'password',
      password_confirmation: 'password',
      school_id: 1,
      student_role: true,
      room_id: Room.first.id
  )
end
