ActiveAdmin.register User do
  permit_params :first_name, :last_name, :phone_number, :password, :password_confirmation,
                :email, :superadmin_role, :teacher_role, :student_role, :school_id, :room_id

  index do
    selectable_column
    column :first_name
    column :last_name
    column :email
    column :phone_number
    column :room
    column :superadmin_role
    column :teacher_role
    column :student_role
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.inputs 'User Details' do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :phone_number
      f.input :school, collection: School.all.map{|u| [u.name, u.id]}
      f.input :room, collection: Room.all.map{|u| [u.name, u.id]}
      f.input :password, as: :hidden, input_html: { value: 'ChangeMe#2' }
      f.input :password_confirmation, as: :hidden, input_html: { value: 'ChangeMe#2' }
    end
    f.inputs 'User Type' do
      f.input :superadmin_role, as: :boolean
      f.input :teacher_role, as: :boolean
      f.input :student_role, as: :boolean
    end
    f.actions
  end
end
