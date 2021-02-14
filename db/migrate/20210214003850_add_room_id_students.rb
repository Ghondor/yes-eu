class AddRoomIdStudents < ActiveRecord::Migration[6.0]
  def change
    add_reference :students, :room, foreign_key: true
  end
end
