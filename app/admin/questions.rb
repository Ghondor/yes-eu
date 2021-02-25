ActiveAdmin.register Question do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :level_id, :question_title, :first_answer, :second_answer, :third_answer, :correct_answer
  #
  # or
  #
  # permit_params do
  #   permitted = [:level_id, :question_title, :first_answer, :second_answer, :third_answer, :correct_answer]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
