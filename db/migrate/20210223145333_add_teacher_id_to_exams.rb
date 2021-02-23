class AddTeacherIdToExams < ActiveRecord::Migration[6.0]
  def change
    add_reference :exams, :teacher, references: :users, index: true
    add_foreign_key :exams, :users, column: :teacher_id
  end
end
