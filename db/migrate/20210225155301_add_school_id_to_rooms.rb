class AddSchoolIdToRooms < ActiveRecord::Migration[6.0]
  def change
    add_reference :rooms, :school, null: false, foreign_key: true
  end
end
