class AddSchoolIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :school, null: false, foreign_key: true
  end
end
