class AddResultRefToExams < ActiveRecord::Migration[6.0]
  def change
    add_reference :exams, :result, null: false, foreign_key: true
  end
end
