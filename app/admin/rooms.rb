ActiveAdmin.register Room do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :head_teacher_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :head_teacher_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form do |f|
    f.inputs 'Classroom Details' do
      f.input :name
      f.input :head_teacher, collection: User.all.where(teacher_role: true).map{|u| ["#{u.last_name} #{u.first_name}", u.id]}
    end
    f.actions
  end

end
