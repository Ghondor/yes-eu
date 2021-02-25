ActiveAdmin.register Exam do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :teacher_id, :result_id, :school_id, :title
  #
  # or
  #
  # permit_params do
  #   permitted = [:teacher_id, :result_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
