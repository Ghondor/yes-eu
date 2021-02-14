class AddHeadeTeacherIdToRooms < ActiveRecord::Migration[6.0]
  def change
    add_reference :rooms, :head_teacher, references: :users, index: true
    add_foreign_key :rooms, :users, column: :head_teacher_id
  end
end
