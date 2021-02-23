class AddTeacherIdToLevels < ActiveRecord::Migration[6.0]
  def change
    add_reference :levels, :teacher, references: :users, index: true
    add_foreign_key :levels, :users, column: :teacher_id
  end
end
