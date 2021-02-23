class AddStudentIdToResults < ActiveRecord::Migration[6.0]
  def change
    add_reference :results, :student, references: :users, index: true
    add_foreign_key :results, :users, column: :student_id
  end
end
