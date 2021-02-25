ActiveAdmin.register Level do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :exam_id, :teacher_id, :title
  #
  # or
  #
  # permit_params do
  #   permitted = [:exam_id, :teacher_id, :title]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
