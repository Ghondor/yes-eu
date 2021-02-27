class AddExamIdToResults < ActiveRecord::Migration[6.0]
  def change
    add_reference :results, :exam, null: false, foreign_key: true
  end
end
