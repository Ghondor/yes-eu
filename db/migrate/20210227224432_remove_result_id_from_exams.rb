class RemoveResultIdFromExams < ActiveRecord::Migration[6.0]
  def change
    remove_reference(:exams, :result, index: true, foreign_key: true)
  end
end
