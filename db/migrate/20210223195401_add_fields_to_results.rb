class AddFieldsToResults < ActiveRecord::Migration[6.0]
  def change
    add_column :results, :grade, :integer
  end
end
