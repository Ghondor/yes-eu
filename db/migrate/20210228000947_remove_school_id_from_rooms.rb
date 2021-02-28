class RemoveSchoolIdFromRooms < ActiveRecord::Migration[6.0]
  def change
    remove_reference(:rooms, :school, index: true, foreign_key: true)
  end
end
