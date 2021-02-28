class AddFieldsToResults < ActiveRecord::Migration[6.0]
  def change
    add_column :results, :grade, :integer
    add_column :results, :taken, :boolean, default: false
  end
end
