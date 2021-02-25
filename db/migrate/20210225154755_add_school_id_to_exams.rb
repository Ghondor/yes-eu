class AddSchoolIdToExams < ActiveRecord::Migration[6.0]
  def change
    add_reference :exams, :school, null: false, foreign_key: true
  end
end
